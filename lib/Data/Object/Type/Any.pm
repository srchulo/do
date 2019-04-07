package Data::Object::Type::Any;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoAny';
}

sub aliases {
  return ['AnyObj', 'AnyObject'];
}

sub coercions {
  return ['Any', sub { do('any', $_[0]) }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Any');

  return 1;
}

1;
