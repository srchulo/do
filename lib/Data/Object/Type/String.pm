package Data::Object::Type::String;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoStr';
}

sub aliases {
  return ['StrObj', 'StrObject', 'StringObj', 'StringObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::String');
  return 0 if !$data->DOES('Data::Object::Role::String');

  return 1;
}

1;
