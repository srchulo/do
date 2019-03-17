package Data::Object::Func::Code::Conjoin;

use Data::Object Class;

extends 'Data::Object::Func::Code';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'CodeRef',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $code) = $self->unpack;

  return sub { $data->(@_) && $code->(@_) };
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
