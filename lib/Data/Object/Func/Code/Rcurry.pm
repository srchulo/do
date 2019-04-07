package Data::Object::Func::Code::Rcurry;

use Data::Object 'Class';

extends 'Data::Object::Func::Code';

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
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, @args) = $self->unpack;

  return sub { $data->(@_, @args) };
}

sub mapping {
  return ('arg1', '@args');
}

1;
