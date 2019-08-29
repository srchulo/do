package Data::Object::Role::Catchable;

use 5.014;

use strict;
use warnings;

use Moo::Role;

# VERSION

# METHODS

sub catch {
  my ($self, $error, $kind) = @_;

  $kind = ref($self) if !$kind;

  return UNIVERSAL::isa($error->object, $kind) ? 1 : 0;
}

1;
