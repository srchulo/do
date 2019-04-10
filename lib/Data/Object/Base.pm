package Data::Object::Base;

use strict;
use warnings;

# VERSION

# BUILD
# METHODS

sub class {
  my ($self) = @_;

  my $class = ref $self || $self;

  return $class;
}

sub space {
  my ($self) = (pop);

  my $class = ref $self || $self;

  require Data::Object::Space;

  return Data::Object::Space->new($class);
}

sub type {
  my ($self) = @_;

  require Data::Object::Export;

  return Data::Object::Export::deduce_type($self);
}

1;
