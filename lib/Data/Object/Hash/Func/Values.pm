package Data::Object::Hash::Func::Values;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Hash::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'HashLike',
  req => 1,
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  return [values %$data];
}

sub mapping {
  return ('arg1');
}

1;
