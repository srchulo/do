package Data::Object::Type::Float;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoFloat';
}

sub aliases {
  return ['FloatObj', 'FloatObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Float');
  return 0 if !$data->DOES('Data::Object::Role::Float');

  return 1;
}

1;
