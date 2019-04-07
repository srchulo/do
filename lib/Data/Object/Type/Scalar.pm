package Data::Object::Type::Scalar;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoScalar';
}

sub aliases {
  return ['ScalarObj', 'ScalarObject'];
}

sub coercions {
  return ['ScalarRef', sub { do('scalar', $_[0]) }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Scalar');

  return 1;
}

1;
