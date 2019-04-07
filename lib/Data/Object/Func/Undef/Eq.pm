package Data::Object::Func::Undef::Eq;

use Data::Object 'Class';

extends 'Data::Object::Func::Undef';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Any',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($arg1, $arg2) = $self->unpack;

  return !!$arg2 ? 0 : 1;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
