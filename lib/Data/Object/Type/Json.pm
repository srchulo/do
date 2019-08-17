package Data::Object::Type::Json;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoJson';
}

sub aliases {
  return ['JsonObj', 'JsonObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Json');

  return 1;
}

1;
