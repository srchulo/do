package Data::Object::Base;

use 5.014;

use strict;
use warnings;

# VERSION

# METHODS

sub class {
  my ($self) = @_;

  my $class = ref $self || $self;

  return $class;
}

sub deduce {
  my ($item) = (pop);

  require Data::Object::Utility;

  return Data::Object::Utility::DeduceDeep($item);
}

sub detract {
  my ($item) = (pop);

  require Data::Object::Utility;

  return Data::Object::Utility::DetractDeep($item);
}

sub space {
  my ($self) = (pop);

  my $class = ref $self || $self;

  require Data::Object::Space;

  return Data::Object::Space->new($class);
}

sub type {
  my ($item) = (pop);

  require Data::Object::Utility;

  return Data::Object::Utility::TypeName($item);
}

1;
