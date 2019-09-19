use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Hash::Func::Kvslice

=abstract

Data-Object Hash Function (Key/Value Slice) Class

=synopsis

  use Data::Object::Hash::Func::Kvslice;

  my $func = Data::Object::Hash::Func::Kvslice->new(@args);

  $func->execute;

=inherits

Data::Object::Hash::Func

=attributes

arg1(Object, req, ro)
args(ArrayRef[Any], req, ro)

=libraries

Data::Object::Library

=description

Data::Object::Hash::Func::Kvslice is a function object for Data::Object::Hash.

=cut

# TESTING

use_ok 'Data::Object::Hash::Func::Kvslice';

ok 1 and done_testing;
