use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Func::Array::Rnsort

=abstract

Data-Object Array Function (Rnsort) Class

=synopsis

  use Data::Object::Func::Array::Rnsort;

  my $func = Data::Object::Func::Array::Rnsort->new(@args);

  $func->execute;

=description

Data::Object::Func::Array::Rnsort is a function object for Data::Object::Array.

=cut

# TESTING

use_ok 'Data::Object::Func::Array::Rnsort';

ok 1 and done_testing;
