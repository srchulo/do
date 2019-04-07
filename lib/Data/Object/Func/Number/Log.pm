package Data::Object::Func::Number::Log;

use Data::Object 'Class';

extends 'Data::Object::Func::Number';

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

  return log($data);
}

sub mapping {
  return ('arg1');
}

1;
