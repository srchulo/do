package Data::Object::Func::Hash::FilterInclude;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has args => (
  is => 'ro',
  isa => 'ArrayRef[Str]',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, @args) = $self->unpack;

  return {
    map { exists($data->{$_}) ? ($_ => $data->{$_}) : () }
      @args
  };
}

sub mapping {
  return ('arg1', '@args');
}

1;
