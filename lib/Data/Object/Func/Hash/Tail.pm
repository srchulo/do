package Data::Object::Func::Hash::Tail;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  $self->throw("The tail() comparison operation is not supported");
}

sub mapping {
  return ('arg1');
}

1;
