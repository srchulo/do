package Data::Object::Func::Scalar::Ne;

use Data::Object 'Class';

extends 'Data::Object::Func::Scalar';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Any',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  $self->throw("The ne() comparison operation is not supported");
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
