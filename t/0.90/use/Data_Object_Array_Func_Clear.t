use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Array::Func::Clear

=abstract

Data-Object Array Function (Clear) Class

=synopsis

  use Data::Object::Array::Func::Clear;

  my $func = Data::Object::Array::Func::Clear->new(@args);

  $func->execute;

=description

Data::Object::Array::Func::Clear is a function object for Data::Object::Array.
This package inherits all behavior from L<Data::Object::Array::Func>.

=cut

# TESTING

use_ok 'Data::Object::Array::Func::Clear';

ok 1 and done_testing;
