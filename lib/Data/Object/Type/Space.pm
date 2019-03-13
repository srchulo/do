package Data::Object::Type::Space;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoSpace';
}

sub aliases {
  return ['SpaceObj', 'SpaceObject'];
}

sub coercions {
  return ['Str', sub { do('space', $_[0]) }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Space');

  return 1;
}

1;
