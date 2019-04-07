package Data::Object::Func::Undef::Defined;

use Data::Object 'Class';

extends 'Data::Object::Func::Undef';

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

  return 0;
}

sub mapping {
  return ('arg1');
}

1;
