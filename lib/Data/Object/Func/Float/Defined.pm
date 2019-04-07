package Data::Object::Func::Float::Defined;

use Data::Object 'Class';

extends 'Data::Object::Func::Float';

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

  return 1;
}

sub mapping {
  return ('arg1');
}

1;
