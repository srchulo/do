package Data::Object::Hash::Func::Defined;

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
  isa => 'StringLike',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $key) = $self->unpack;

  return 1 unless length $key;

  return defined($data->{$key}) ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
