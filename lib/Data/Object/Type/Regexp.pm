package Data::Object::Type::Regexp;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoRegexp';
}

sub aliases {
  return ['RegexpObj', 'RegexpObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Regexp');
  return 0 if !$data->DOES('Data::Object::Role::Regexp');

  return 1;
}

1;
