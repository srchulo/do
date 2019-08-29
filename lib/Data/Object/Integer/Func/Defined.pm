package Data::Object::Integer::Func::Defined;

use Data::Object 'Class';

extends 'Data::Object::Integer::Func';

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
