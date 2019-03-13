package Data::Object::Func::Array::Keys;

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

  my ($data) = $self->unpack;

  return [0 .. $#{$data}];
}

sub mapping {
  return ('arg1');
}

1;
