package Data::Object::Array::Func::Keyed;

use Data::Object 'Class';

extends 'Data::Object::Array::Func';

# VERSION

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

  my ($data, @keys) = $self->unpack;

  my $i = 0;
  return {map { $_ => $data->[$i++] } @keys};
}

sub mapping {
  return ('arg1', '@args');
}

1;
