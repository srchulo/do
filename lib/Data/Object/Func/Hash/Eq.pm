package Data::Object::Func::Hash::Eq;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'HashLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  $self->throw("Equal-to is not supported");

  return;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
