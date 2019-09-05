package Data::Object::Array::Func::Join;

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
  isa => 'Str',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $delimiter) = $self->unpack;

  return join $delimiter // '', @$data;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
