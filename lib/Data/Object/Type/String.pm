package Data::Object::Type::String;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoStr';
}

sub aliases {
  return ['StrObj', 'StrObject', 'StringObj', 'StringObject'];
}

sub coercions {
  return ['Str', sub {
      require Data::Object::String;
      Data::Object::String->new($_[0]);
  }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::String');

  return 1;
}

1;
