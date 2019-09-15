package Data::Object::Scalar::Func::Lt;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Scalar::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Any',
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

  $self->throw("Less-than is not supported");

  return;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
