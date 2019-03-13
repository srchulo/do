package Data::Object::Func::Array::Delete;

use Data::Object Class;

extends 'Data::Object::Func::Array';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Int',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $index) = $self->unpack;

  return delete($data->[$index]);
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
