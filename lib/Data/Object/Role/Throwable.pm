package Data::Object::Role::Throwable;

use strict;
use warnings;

use Data::Object::Role;

# VERSION

# BUILD
# METHODS

sub throw {
  my ($self, $message) = @_;

  require Data::Object::Exception;

  my $class = 'Data::Object::Exception';

  @_ = ($class => ($message, $self));

  goto $class->can('throw');
}

1;
