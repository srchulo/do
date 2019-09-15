package Data::Object::Number::Func::Decr;

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

has arg2 => (
  is => 'ro',
  isa => 'StringLike',
  def => 1,
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $arg2) = $self->unpack;

  unless (Scalar::Util::looks_like_number("$arg2")) {
    return $self->throw("Argument is not number-like");
  }

  return "$data" - "$arg2";
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
