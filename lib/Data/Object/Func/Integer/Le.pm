package Data::Object::Func::Integer::Le;

use Data::Object 'Class';

extends 'Data::Object::Func::Integer';

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
    $self->throw('Argument is not number-like');
  }

  return (("$arg1" + 0) <= ("$arg2" + 0)) ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
