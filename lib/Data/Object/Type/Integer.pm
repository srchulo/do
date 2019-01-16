package Data::Object::Type::Integer;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoInt';
}

sub aliases {
  return ['IntObj', 'IntObject', 'IntegerObj', 'IntegerObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Integer');
  return 0 if !$data->DOES('Data::Object::Role::Integer');

  return 1;
}

1;
