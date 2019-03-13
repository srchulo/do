package Data::Object::Func::Hash::Exists;

use Data::Object Class;

extends 'Data::Object::Func::Hash';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Num',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $key) = $self->unpack;

  return exists $data->{$key} ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
