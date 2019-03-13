package Data::Object::Func::Number::Upto;

use Data::Object Class;

extends 'Data::Object::Func::Number';

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

  my ($arg1, $arg2) = $self->unpack;

  unless (Scalar::Util::looks_like_number("$arg2")) {
    return $self->throw("Argument is not number-like");
  }

  return [int("$arg1") .. int("$arg2")];
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
