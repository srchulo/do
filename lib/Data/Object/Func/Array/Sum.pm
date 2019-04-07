package Data::Object::Func::Array::Sum;

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

  my $sum = 0;

  for my $val (@$data) {
    if (!defined($val)) {
      next;
    } elsif (Scalar::Util::blessed($val)) {
      next if !overload::Method($val, q[""]);
    } elsif (!Scalar::Util::looks_like_number($val)) {
      next;
    }

    $sum += $val + 0;
  }

  return $sum;
}

sub mapping {
  return ('arg1');
}

1;
