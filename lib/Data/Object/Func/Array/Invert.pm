package Data::Object::Func::Array::Invert;

use Data::Object Class;

extends 'Data::Object::Func::Array';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  return $self->arg1->reverse;
}

sub mapping {
  return ('arg1');
}

1;