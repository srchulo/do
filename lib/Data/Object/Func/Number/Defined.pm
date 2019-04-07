package Data::Object::Func::Number::Defined;

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

  return 1;
}

sub mapping {
  return ('arg1');
}

1;
