package Data::Object::Func::Hash::EachValue;

use Data::Object Class;

extends 'Data::Object::Func::Hash';

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

has args => (
  is => 'ro',
  isa => 'ArrayRef[Any]',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $code, @args) = $self->unpack;

  for my $key (keys %$data) {
    my $value = $data->{$key};

    $code->($value, @args);
  }

  return $data;
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;
