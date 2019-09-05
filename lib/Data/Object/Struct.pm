package Data::Object::Struct;

use 5.014;

use strict;
use warnings;

use Moo;

with 'Data::Object::Role::Immutable';

# VERSION

# BUILD

sub BUILD {
  my ($self, $args) = @_;

  $self->immutable;

  return $args;
}

1;
