package Data::Object::Type::String;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoStr';
}

sub aliases {
  return ['StrObj', 'StrObject', 'StringObj', 'StringObject'];
}

sub coercions {
  return ['Str', sub { do('string', $_[0]) }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::String');

  return 1;
}

1;
