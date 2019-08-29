package Data::Object::Role::Output;

use 5.014;

use strict;
use warnings;

use Moo::Role;

# VERSION

# BUILD
# METHODS

sub print {
  my ($self) = @_;

  my @result = Data::Object::Role::Dumper::dump($self);

  return CORE::print(@result);
}

sub say {
  my ($self) = @_;

  my @result = Data::Object::Role::Dumper::dump($self);

  return CORE::print(@result, "\n");
}

1;
