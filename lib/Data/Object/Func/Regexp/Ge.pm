package Data::Object::Func::Regexp::Ge;

use Data::Object 'Class';

extends 'Data::Object::Func::Regexp';

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

  $self->throw("Greater-than or equal-to is not supported");

  return;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
