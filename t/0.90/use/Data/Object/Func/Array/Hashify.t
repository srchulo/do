use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Func::Array::Hashify

=abstract

Data-Object Array Function (Hashify) Class

=synopsis

  use Data::Object::Func::Array::Hashify;

  my $func = Data::Object::Func::Array::Hashify->new(@args);

  $func->execute;

=description

Data::Object::Func::Array::Hashify is a function object for Data::Object::Array.

=cut

# TESTING

use_ok 'Data::Object::Func::Array::Hashify';

ok 1 and done_testing;