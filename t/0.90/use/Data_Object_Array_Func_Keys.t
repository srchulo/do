use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Array::Func::Keys

=abstract

Data-Object Array Function (Keys) Class

=synopsis

  use Data::Object::Array::Func::Keys;

  my $func = Data::Object::Array::Func::Keys->new(@args);

  $func->execute;

=inherits

Data::Object::Array::Func

=attributes

arg1(Object, req, ro)

=libraries

Data::Object::Library

=description

Data::Object::Array::Func::Keys is a function object for Data::Object::Array.

=cut

# TESTING

use_ok 'Data::Object::Array::Func::Keys';

ok 1 and done_testing;
