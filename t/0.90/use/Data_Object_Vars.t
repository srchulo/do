use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object::Vars

=abstract

Data-Object Environment Variables

=synopsis

  use Data::Object::Vars;

  my $vars = Data::Object::Vars->new;

  my $home = $vars->get('HOME');
  my $user = $vars->get('USER');

  my $paths = $vars->get('PATH')->split(qr/:/);

  say $paths->count;

=inherits

Data::Object::Hash

=libraries

Data::Object::Library

=description

This package provides an object-oriented interface to the processes environment
variables.

=cut

use_ok "Data::Object::Vars";

ok 1 and done_testing;
