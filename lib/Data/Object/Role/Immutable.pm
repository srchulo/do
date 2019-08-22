package Data::Object::Role::Immutable;

use strict;
use warnings;

use Data::Object::Role;

use Readonly;

# VERSION

# METHODS

sub immutable {
  my ($self) = @_;

  Readonly::Hash   %$self => %$self if UNIVERSAL::isa $self, 'HASH';
  Readonly::Array  @$self => @$self if UNIVERSAL::isa $self, 'ARRAY';
  Readonly::Scalar $$self => $$self if UNIVERSAL::isa $self, 'SCALAR';

  return $self;
}

1;
