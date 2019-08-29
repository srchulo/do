package Data::Object::Number::Func::Exp;

use Data::Object 'Class';

extends 'Data::Object::Number::Func';

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

  return exp($data);
}

sub mapping {
  return ('arg1');
}

1;
