package Data::Object::Type::Any;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoAny';
}

sub aliases {
  return ['AnyObj', 'AnyObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Any');
  return 0 if !$data->DOES('Data::Object::Role::Any');

  return 1;
}

1;
