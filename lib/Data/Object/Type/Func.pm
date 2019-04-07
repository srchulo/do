package Data::Object::Type::Func;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoFunc';
}

sub aliases {
  return ['FuncObj', 'FuncObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Func');

  return 1;
}

1;
