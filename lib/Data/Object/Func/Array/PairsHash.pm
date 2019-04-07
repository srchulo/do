package Data::Object::Func::Array::PairsHash;

use Data::Object 'Class';

extends 'Data::Object::Func::Array';

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

  my $i = 0;
  return {map { $i++ => $_ } @$data};
}

sub mapping {
  return ('arg1');
}

1;
