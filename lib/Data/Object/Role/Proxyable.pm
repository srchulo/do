package Data::Object::Role::Proxyable;

use 5.014;

use strict;
use warnings;

use Moo::Role;

use Carp ();

# VERSION

# BUILD

sub AUTOLOAD {
  my ($self) = @_;

  my (@namespace) = our $AUTOLOAD =~ /^(.+)::(.+)$/;

  my ($package, $method) = @namespace;

  my $build = $package->can('BUILDPROXY');

  my $error = qq(Can't locate object method "$method" via package "$package");

  Carp::confess($error) unless $build && ref($build) eq 'CODE';

  my $proxy = $build->($package, $method, @_);

  Carp::confess($error) unless $proxy && ref($proxy) eq 'CODE';

  goto &$proxy;
}

sub DESTROY {
  return;
}

# METHODS

1;
