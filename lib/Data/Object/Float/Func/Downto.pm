package Data::Object::Float::Func::Downto;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Float::Func';

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
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($arg1, $arg2) = $self->unpack;

  unless (Scalar::Util::looks_like_number("$arg2")) {
    return $self->throw("Argument is not number-like");
  }

  return [reverse(int("$arg2") .. int("$arg1"))];
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
