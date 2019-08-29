use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Array::Func::Sum

=abstract

Data-Object Array Function (Sum) Class

=synopsis

  use Data::Object::Array::Func::Sum;

  my $func = Data::Object::Array::Func::Sum->new(@args);

  $func->execute;

=description

Data::Object::Array::Func::Sum is a function object for Data::Object::Array.

=cut

# TESTING

use_ok 'Data::Object::Array::Func::Sum';

ok 1 and done_testing;
