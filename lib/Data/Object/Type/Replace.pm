package Data::Object::Type::Replace;

use strict;
use warnings;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoReplace';
}

sub aliases {
  return ['ReplaceObj', 'ReplaceObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Replace');

  return 1;
}

1;
