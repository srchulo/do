package Data::Object::Role::Type;

use strict;
use warnings;

use feature 'state';

use Data::Object::Role;

# VERSION

# BUILD
# METHODS

sub methods {
  my ($self) = @_;

  state %methods;

  my $class = ref($self) || $self;

  no strict 'refs';

  if (defined $methods{$class}) {
    return [sort @{$methods{$class}}];
  }
  return [
    sort grep *{"${class}::$_"}{CODE},
    grep /^[_a-zA-Z]/, keys %{"${class}::"}
  ];
}

sub type {
  my ($self) = @_;

  require Data::Object;

  return Data::Object::Export::deduce_type($self);
}

1;
