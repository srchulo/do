package Data::Object::Type::Number;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoNum';
}

sub aliases {
  return ['NumObj', 'NumObject', 'NumberObj', 'NumberObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Number');
  return 0 if !$data->DOES('Data::Object::Role::Number');

  return 1;
}

1;
