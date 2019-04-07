package Data::Object::Func::String::Lines;

use Data::Object 'Class';

extends 'Data::Object::Func::String';

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

  return [split(/[\n\r]+/, "$data")];
}

sub mapping {
  return ('arg1');
}

1;
