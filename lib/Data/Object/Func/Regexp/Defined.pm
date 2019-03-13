package Data::Object::Func::Regexp::Defined;

use Data::Object Class;

extends 'Data::Object::Func::Regexp';

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

  return 1;
}

sub mapping {
  return ('arg1');
}

1;
