package Data::Object::Role::Catchable;

use strict;
use warnings;

use Data::Object::Role;

# VERSION

# BUILD
# METHODS

sub catch {
  my ($self, $error, $kind) = @_;

  $kind = ref($self) if !$kind;

  return UNIVERSAL::isa($error->object, $kind) ? 1 : 0;
}

1;
