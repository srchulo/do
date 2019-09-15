use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Array::Func::Each

=abstract

Data-Object Array Function (Each) Class

=synopsis

  use Data::Object::Array::Func::Each;

  my $func = Data::Object::Array::Func::Each->new(@args);

  $func->execute;

=inherits

Data::Object::Array::Func

=attributes

arg1(ArrayLike, req, ro)
arg2(StringLikeingLike | CodeLike, req, ro)
args(ArrayRef[Any], opt, ro)

=libraries

Data::Object::Library

=description

Data::Object::Array::Func::Each is a function object for Data::Object::Array.

=cut

# TESTING

use_ok 'Data::Object::Array::Func::Each';

ok 1 and done_testing;
