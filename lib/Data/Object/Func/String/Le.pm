package Data::Object::Func::String::Le;

use Data::Object 'Class';

extends 'Data::Object::Func::String';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'StringLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($arg1, $arg2) = $self->unpack;

  return ("$arg1" le "$arg2") ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
