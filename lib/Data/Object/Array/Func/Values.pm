package Data::Object::Array::Func::Values;

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

has args => (
  is => 'ro',
  isa => 'ArrayRef[Int]',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, @args) = $self->unpack;

  return [@args ? @$data[@args] : @$data];
}

sub mapping {
  return ('arg1', '@args');
}

1;
