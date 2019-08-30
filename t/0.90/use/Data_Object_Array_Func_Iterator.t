use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Array::Func::Iterator

=abstract

Data-Object Array Function (Iterator) Class

=synopsis

  use Data::Object::Array::Func::Iterator;

  my $func = Data::Object::Array::Func::Iterator->new(@args);

  $func->execute;

=description

Data::Object::Array::Func::Iterator is a function object for
Data::Object::Array. This package inherits all behavior from
L<Data::Object::Array::Func>.

=cut

# TESTING

use_ok 'Data::Object::Array::Func::Iterator';

ok 1 and done_testing;
