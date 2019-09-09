package Data::Object::Role::Stashable;

use 5.014;

use strict;
use warnings;

use Moo::Role;

# VERSION

# BUILD

sub BUILD {
  my ($self, $args) = @_;

  $args->{'$stash'} = {} if !$args->{'$stash'};

  return $args;
}

# METHODS

sub stash {
  my ($self, $key, $value) = @_;

  return $self->{'$stash'} if !exists $_[1];

  return $self->{'$stash'}->{$key} if !exists $_[2];

  $self->{'$stash'}->{$key} = $value;

  return $value;
}

1;
