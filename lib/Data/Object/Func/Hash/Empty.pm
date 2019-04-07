package Data::Object::Func::Hash::Empty;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

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

  my ($data) = $self->unpack;

  delete @$data{keys %$data};

  return $data;
}

sub mapping {
  return ('arg1');
}

1;
