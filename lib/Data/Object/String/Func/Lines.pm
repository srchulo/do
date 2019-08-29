package Data::Object::String::Func::Lines;

use Data::Object 'Class';

extends 'Data::Object::String::Func';

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
