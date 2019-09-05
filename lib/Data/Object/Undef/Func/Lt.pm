package Data::Object::Undef::Func::Lt;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Undef::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Any',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($arg1, $arg2) = $self->unpack;

  return (!!$arg1 lt !!$arg2) ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
