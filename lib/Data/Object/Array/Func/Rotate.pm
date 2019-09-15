package Data::Object::Array::Func::Rotate;

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

  my ($data) = $self->unpack;

  push(@$data, shift(@$data));

  return $data;
}

sub mapping {
  return ('arg1');
}

1;
