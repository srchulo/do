use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

space

=usage

  my $space = $vars->space; # Data::Object::Hash

=description

The space method returns a L<Data::Object::Space> object for the namespace
C<Data::Object::Hash> namespace.

=signature

space() : SpaceObject

=type

method

=cut

# TESTING

use Data::Object::Vars;

can_ok "Data::Object::Vars", "space";

ok 1 and done_testing;
