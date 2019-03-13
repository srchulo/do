package Data::Object::Type::Data;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoData';
}

sub aliases {
  return ['DataObj', 'DataObject'];
}

sub coercions {
  return ['Str', sub { do('data', 'from', $_[0]) }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Data');

  return 1;
}

1;
