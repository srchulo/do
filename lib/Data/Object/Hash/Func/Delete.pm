package Data::Object::Hash::Func::Delete;

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
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'NumberLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $key) = $self->unpack;

  return delete($data->{$key});
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
