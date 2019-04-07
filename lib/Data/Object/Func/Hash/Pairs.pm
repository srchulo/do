package Data::Object::Func::Hash::Pairs;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

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

  return [map { [$_, $data->{$_}] } sort keys(%$data)];
}

sub mapping {
  return ('arg1');
}

1;
