package Data::Object::Type::Undef;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

sub name {
  return 'DoUndef';
}

sub aliases {
  return ['UndefObj', 'UndefObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Undef');
  return 0 if !$data->DOES('Data::Object::Role::Undef');

  return 1;
}

1;
