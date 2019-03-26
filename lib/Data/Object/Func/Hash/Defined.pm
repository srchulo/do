package Data::Object::Func::Hash::Defined;

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
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $key) = $self->unpack;

  return 1 unless length $key;

  return defined($data->{$key}) ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
