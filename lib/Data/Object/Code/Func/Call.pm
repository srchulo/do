package Data::Object::Code::Func::Call;

use Data::Object 'Class';

extends 'Data::Object::Code::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has args => (
  is => 'ro',
  isa => 'ArrayRef[Any]',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, @args) = $self->unpack;

  return $data->(@args);
}

sub mapping {
  return ('arg1', '@args');
}

1;
