package Data::Object::Func::Array::Pairs;

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

  return $self->arg1->pairs_array;
}

sub mapping {
  return ('arg1');
}

1;
