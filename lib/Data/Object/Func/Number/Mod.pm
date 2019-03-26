package Data::Object::Func::Number::Mod;

use Data::Object 'Class';

extends 'Data::Object::Func::Number';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'StringLike',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $arg2) = $self->unpack;

  return "$data" % "$arg2";
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
