package Data::Object::Array::Func::Pairs;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Array::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'ArrayLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  return $self->arg1->pairs_array;
}

sub mapping {
  return ('arg1');
}

1;
