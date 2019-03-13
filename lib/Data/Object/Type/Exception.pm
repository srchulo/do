package Data::Object::Type::Exception;

use strict;
use warnings;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoException';
}

sub aliases {
  return ['ExceptionObj', 'ExceptionObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Exception');

  return 1;
}

1;
