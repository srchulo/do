package Data::Object::Role::Tryable;

use 5.014;

use strict;
use warnings;

use Moo::Role;
use Data::Object::Try;

# VERSION

# METHODS

sub try {
  my ($self, $callback, @args) = @_;

  my $try = Data::Object::Try->new(invocant => $self, arguments => [@args]);

  $callback = $try->callback($callback); # build callback

  return $try->call($callback);
}

1;
