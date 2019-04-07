package Data::Object::Kind;

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
  my $self = $_[-1];

  my $class = ref $self || $self;

  require Data::Object::Space;

  return Data::Object::Space->new($class);
}

1;
