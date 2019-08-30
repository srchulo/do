use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Number::Func::Ge

=abstract

Data-Object Number Function (Ge) Class

=synopsis

  use Data::Object::Number::Func::Ge;

  my $func = Data::Object::Number::Func::Ge->new(@args);

  $func->execute;

=description

Data::Object::Number::Func::Ge is a function object for Data::Object::Number.
This package inherits all behavior from L<Data::Object::Number::Func>.

=cut

# TESTING

use_ok 'Data::Object::Number::Func::Ge';

ok 1 and done_testing;
