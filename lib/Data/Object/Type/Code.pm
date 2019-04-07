package Data::Object::Type::Code;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoCode';
}

sub aliases {
  return ['CodeObj', 'CodeObject'];
}

sub coercions {
  return ['CodeRef', sub { do('code', $_[0]) }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Code');

  return 1;
}

1;
