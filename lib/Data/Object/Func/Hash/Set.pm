package Data::Object::Func::Hash::Set;

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

has args => (
  is => 'ro',
  isa => 'ArrayRef[Any]',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $key, $value) = $self->unpack;

  return $data->{$key} = $value;
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;
