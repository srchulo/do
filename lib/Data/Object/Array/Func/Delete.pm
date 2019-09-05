package Data::Object::Array::Func::Delete;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Array::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Int',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $index) = $self->unpack;

  return delete($data->[$index]);
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
