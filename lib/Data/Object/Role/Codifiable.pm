package Data::Object::Role::Codifiable;

use strict;
use warnings;

use Data::Object::Role;

# BUILD
# METHODS

sub codify {
  my ($self, @args) = @_;

  require Data::Object::Export;

  return Data::Object::Export::codify(@args);
}

1;
