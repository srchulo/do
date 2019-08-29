package Data::Object::Role::Throwable;

use 5.014;

use strict;
use warnings;

use Moo::Role;

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
