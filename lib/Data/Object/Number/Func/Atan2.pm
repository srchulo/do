package Data::Object::Number::Func::Atan2;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Number::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'StringLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $arg2) = $self->unpack;

  unless (Scalar::Util::looks_like_number("$arg2")) {
    return $self->throw("Argument is not number-like");
  }

  return atan2($data, $arg2);
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
