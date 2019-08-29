package Data::Object::Undef::Func::Defined;

use Data::Object 'Class';

extends 'Data::Object::Undef::Func';

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
