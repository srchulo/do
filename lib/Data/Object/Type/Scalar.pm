package Data::Object::Type::Scalar;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoScalar';
}

sub aliases {
  return ['ScalarObj', 'ScalarObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Scalar');
  return 0 if !$data->DOES('Data::Object::Role::Scalar');

  return 1;
}

1;
