package Data::Object::Func::Array::Set;

use Data::Object 'Class';

extends 'Data::Object::Func::Array';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

has arg3 => (
  is => 'ro',
  isa => 'Any',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $index, $value) = $self->unpack;

  return $data->[$index] = $value;
}

sub mapping {
  return ('arg1', 'arg2', 'arg3');
}

1;
