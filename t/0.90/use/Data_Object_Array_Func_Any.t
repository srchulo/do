use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Array::Func::Any

=abstract

Data-Object Array Function (Any) Class

=synopsis

  use Data::Object::Array::Func::Any;

  my $func = Data::Object::Array::Func::Any->new(@args);

  $func->execute;

=inherits

Data::Object::Array::Func

=description

Data::Object::Array::Func::Any is a function object for Data::Object::Array.

=cut

# TESTING

use_ok 'Data::Object::Array::Func::Any';

ok 1 and done_testing;
