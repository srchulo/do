use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Array::Func::Delete

=abstract

Data-Object Array Function (Delete) Class

=synopsis

  use Data::Object::Array::Func::Delete;

  my $func = Data::Object::Array::Func::Delete->new(@args);

  $func->execute;

=description

Data::Object::Array::Func::Delete is a function object for Data::Object::Array.
This package inherits all behavior from L<Data::Object::Array::Func>.

=cut

# TESTING

use_ok 'Data::Object::Array::Func::Delete';

ok 1 and done_testing;
