package Data::Object::Func::Array::Min;

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

  my $min;

  for my $val (@$data) {
    next if ref($val);
    next if !defined($val);
    next if !Scalar::Util::looks_like_number($val);

    $min //= $val;
    $min = $val if $val < $min;
  }

  return $min;
}

sub mapping {
  return ('arg1');
}

1;
