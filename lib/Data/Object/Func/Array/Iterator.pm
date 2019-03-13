package Data::Object::Func::Array::Iterator;

use Data::Object Class;

extends 'Data::Object::Func::Array';

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

  return sub {
    return undef if $i > $#{$data};
    return $data->[$i++];
  }
}

sub mapping {
  return ('arg1');
}

1;
