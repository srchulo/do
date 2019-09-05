package Data::Object::String::Func::Uc;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::String::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  return uc("$data");
}

sub mapping {
  return ('arg1');
}

1;
