package Data::Object::Type::Search;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoSearch';
}

sub aliases {
  return ['SearchObj', 'SearchObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Search');

  return 1;
}

1;
