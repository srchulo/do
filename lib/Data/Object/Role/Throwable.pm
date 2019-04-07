package Data::Object::Role::Throwable;

use strict;
use warnings;

use Data::Object::Role;

# VERSION

# BUILD
# METHODS

sub throw {
  my ($self, @args) = @_;

  require Data::Object::Export;

  my $class = Data::Object::Export::load('Data::Object::Exception');

  unshift @args, ref($args[0]) ? 'object' : 'message' if @args == 1;

  @_ = ($class => (object => $self, @args));

  goto $class->can('throw');
}

1;
