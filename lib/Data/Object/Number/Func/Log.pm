package Data::Object::Number::Func::Log;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Number::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'NumberLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  return log($data);
}

sub mapping {
  return ('arg1');
}

1;
