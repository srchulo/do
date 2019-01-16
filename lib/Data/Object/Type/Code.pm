package Data::Object::Type::Code;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoCode';
}

sub aliases {
  return ['CodeObj', 'CodeObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Code');
  return 0 if !$data->DOES('Data::Object::Role::Code');

  return 1;
}

1;
