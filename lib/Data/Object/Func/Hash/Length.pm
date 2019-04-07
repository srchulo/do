package Data::Object::Func::Hash::Length;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

# VERSION

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

  return scalar keys %$data;
}

sub mapping {
  return ('arg1');
}

1;
