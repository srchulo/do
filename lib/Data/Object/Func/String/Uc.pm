package Data::Object::Func::String::Uc;

use Data::Object Class;

extends 'Data::Object::Func::String';

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

  return uc("$data");
}

sub mapping {
  return ('arg1');
}

1;
