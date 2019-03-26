package Data::Object::Func::Hash::Get;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

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

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $key) = $self->unpack;

  return $data->{$key};
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
