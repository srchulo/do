package Data::Object::Exception;

use Data::Object::Class;

use parent 'Data::Object::Kind';

use overload (
  '""'     => 'data',
  '~~'     => 'data',
  fallback => 1
);

# VERSION

# BUILD

sub BUILD {
  my ($self, $data) = @_;

  my @attrs = qw(
    default
    file
    frames
    line
    message
    object
    package
    subroutine
  );

  for my $attr (@attrs) {
    $self->{$attr} = $data->{$attr} if defined $data->{$attr};
  }

  unless (defined $self->{default}) {
    $self->{default} = 'An exception was thrown';
  }

  unless (defined $self->{frames}) {
    $self->{frames} = undef;
  }

  return $self;
}

# METHODS

sub data {
  my ($self) = @_;

  my $file = $self->{file};
  my $line = $self->{line};
  my $default = $self->{default};
  my $message = $self->{message};
  my $object  = $self->{object};

  my @with = ("by", (ref($object) || $object)) if $object && !$message;

  return join(" ", $message || $default, @with, "in $file at line $line");
}

sub dump {
  my ($self) = @_;

  require Data::Dumper;

  local $Data::Dumper::Terse = 1;

  return Data::Dumper::Dumper($self);
}

sub explain {
  my ($self) = @_;

  my @data = $self->data;

  for my $frame (@{$self->{frames}}) {
    push @data, "@{[$$frame[3]]} in @{[$$frame[1]]} at line @{[$$frame[2]]}";
  }

  return join("\n", @data);
}

sub throw {
  my ($self, @args) = @_;

  my $class = ref($self) || $self || __PACKAGE__;

  unshift @args, (ref($args[0]) ? 'object' : 'message') if @args == 1;

  my $frames = [];

  for (my $i = 0; my @caller = caller($i); $i++) {
    push @$frames, [@caller];
  }

  die $class->new((ref($self) ? (object => $self) : ()), @args,
    file       => $frames->[0][1],
    line       => $frames->[0][2],
    package    => $frames->[0][0],
    subroutine => $frames->[0][3],
    frames     => $frames
  );
}

1;
