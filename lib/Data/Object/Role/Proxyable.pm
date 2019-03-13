package Data::Object::Role::Proxyable;

use strict;
use warnings;

use Data::Object::Role;

use Carp ();

# BUILD

sub AUTOLOAD {
  my ($self) = @_;

  my (@namespace) = our $AUTOLOAD =~ /^(.+)::(.+)$/;

  my ($package, $method) = @namespace;

  my $build = $package->can('BUILDPROXY');

  my $error = qq(Can't locate object method "$method" via package "$package");

  Carp::croak($error) unless $build && ref($build) eq 'CODE';

  my $proxy = $build->($package, $method, @_);

  Carp::croak($error) unless $proxy && ref($proxy) eq 'CODE';

  goto &$proxy;
}

sub DESTROY {
  return;
}

# METHODS

1;
