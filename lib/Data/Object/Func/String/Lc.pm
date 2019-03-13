package Data::Object::Func::String::Lc;

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

  return lc("$data");
}

sub mapping {
  return ('arg1');
}

1;
