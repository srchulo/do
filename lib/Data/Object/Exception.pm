package Data::Object::Exception;

use 5.014;

use strict;
use warnings;

use overload (
  '""'     => 'data',
  '~~'     => 'data',
  fallback => 1
);

# VERSION

# BUILD

sub new {
  my ($class, @args) = @_;

  my %args;
  my $data = {};
  my $self = bless $data, $class;

  %args = @args == 1
    ? !ref($args[0])
      # single non-ref argument
      ? (message => $args[0])
      : %{$args[0]}
    : @args;

  for my $attr (qw(message context)) {
    $self->{$attr} = $args{$attr} if exists $args{$attr};
  }

  return $self;
}

# METHODS

sub data {
  my ($self) = @_;

  $self->trace(1, 1) if !$self->{frames};

  my $frames = $self->{frames};

  my $file = $frames->[0][1];
  my $line = $frames->[0][2];
  my $pack = $frames->[0][0];
  my $subr = $frames->[0][3];

  my $message = $self->{message} || 'Exception!';

  my @stacktrace = ("$message in $file at line $line");

  for (my $i = 1; $i < @$frames; $i++) {
    my $file = $frames->[$i][1];
    my $line = $frames->[$i][2];
    my $pack = $frames->[$i][0];
    my $subr = $frames->[$i][3];

    push @stacktrace, "\t${pack}::${subr} in $file at line $line";
  }

  return join "\n", @stacktrace, "";
}

sub throw {
  my ($self, $message, $context) = @_;

  if (ref $self) {
    $message ||= $self->{message};
    $context ||= $self->{context};

    $self = ref $self;
  }

  my $exception = $self->new(message => $message, context => $context);

  die $exception->trace;
}

sub trace {
  my ($self, $offset, $limit) = @_;

  $self->{frames} = my $frames = [];

  for (my $i = $offset // 1; my @caller = caller($i); $i++) {
    push @$frames, [@caller];

    last if defined $limit && $i + 1 == $offset + $limit;
  }

  return $self;
}

1;
