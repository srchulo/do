package Data::Object::Struct;

use strict;
use warnings;

use Data::Object::Class;

with 'Data::Object::Role::Immutable';

# VERSION

# BUILD

sub BUILD {
  my ($self, $args) = @_;

  $self->immutable;

  return $args;
}

1;
