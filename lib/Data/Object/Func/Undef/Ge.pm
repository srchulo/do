package Data::Object::Func::Undef::Ge;

use Data::Object Class;

extends 'Data::Object::Func::Undef';

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

  return (!!$arg1 ge !!$arg2) ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
