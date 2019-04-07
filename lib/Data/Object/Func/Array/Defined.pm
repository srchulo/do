package Data::Object::Func::Array::Defined;

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
  isa => 'Int',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $index) = $self->unpack;

  return 1 unless $index;

  return defined($data->[$index]) ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
