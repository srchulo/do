package Data::Object::Cli;

use Getopt::Long ();

use Data::Object::Class;

use parent 'Data::Object::Kind';

# BUILD

sub BUILD {
  my ($self, $data) = @_;

  my @attrs = qw(env args opts);

  for my $attr (grep { defined $data->{$_} } @attrs) {
    $self->{$attr} = $data->{$attr};
  }

  unless (defined $self->{env}) {
    $self->{env} = \%ENV;
  }

  unless (defined $self->{args}) {
    $self->{args} = \@ARGV;
  }

  unless (defined $self->{opts}) {
    $self->{opts} = parse($self->{args}, [$self->specs()]);
  }

  # (optionally) use getopts primary-name for attributes
  for my $name (map +((split(/\|/, $_, 2))[0]), $self->specs()) {
    $self->{$name} = $self->{opts}{$name} if defined $self->{opts}{$name};
  }

  return $self;
}

# METHODS

sub env {
  my ($self) = @_;

  return $self->{env};
}

sub args {
  my ($self) = @_;

  return $self->{args};
}

sub opts {
  my ($self) = @_;

  return $self->{opts};
}

sub run {
  my ($class, @args) = @_;

  unless (caller(1)) {
    my $self = $class->new(@args);

    $self->main(env => $self->env, args => $self->args, opts => $self->opts);
  }

  return time;
}

sub parse {
  my ($data, $specs, $opts) = @_;

  my $vars = {};

  my @config = qw(
    default
    no_auto_abbrev
    no_ignore_case
  );

  $opts = [] if !$opts;

  Getopt::Long::GetOptionsFromArray($data, $vars, @$specs);
  Getopt::Long::Configure(Getopt::Long::Configure(@config, @$opts));

  return $vars;
}

sub main {
  return;
}

sub specs {
  return;
}

1;
