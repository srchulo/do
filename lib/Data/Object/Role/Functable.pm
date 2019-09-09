package Data::Object::Role::Functable;

use 5.014;

use strict;
use warnings;

use Try::Tiny;
use Moo::Role;

with 'Data::Object::Role::Proxyable';

# VERSION

# BUILD

requires 'deduce';
requires 'space';

sub BUILDPROXY {
  my ($class, $method, $self, @args) = @_;

  return if not defined $self;

  my $func = $self->functor($method);

  return if !$func;

  return sub {
    try {
      return $self->deduce($func->new($self, @args)->execute);
    }
    catch {
      my $error = $_;
      my $message = ref($error) ? $error->{message} : "$error";
      my $signature = "${class}::${method}(@{[join(', ', $func->mapping)]})";

      $self->throw("$signature: $message");
    };
  };
}

# METHODS

sub functor {
  my ($self, $name) = @_;

  return if !$name;

  return eval { $self->space->child(join('::', 'Func', $name))->load };
}

1;
