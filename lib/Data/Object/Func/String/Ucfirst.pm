package Data::Object::Func::String::Ucfirst;

use Data::Object 'Class';

extends 'Data::Object::Func::String';

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

  return ucfirst("$data");
}

sub mapping {
  return ('arg1');
}

1;
