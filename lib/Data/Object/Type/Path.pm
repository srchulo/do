package Data::Object::Type::Path;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoPath';
}

sub aliases {
  return ['PathObj', 'PathObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Path');

  return 1;
}

1;
