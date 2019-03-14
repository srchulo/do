use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

any

=usage

  # given [2..5]

  $array->any('$value > 5'); # 0; false
  $array->any('$value > 3'); # 1; true

=description

The any method returns true if any of the elements in the array meet the
criteria set by the operand and rvalue. This method supports codification, i.e,
takes an argument which can be a codifiable string, a code reference, or a code
data type object. This method returns a L<Data::Object::Number> object.

=signature

any(CodeRef $arg1, Any @args) : NumObject

=type

method

=cut

# TESTING

use_ok 'Data::Object::Array';

my $data = Data::Object::Array->new([2..5]);

is_deeply $data->any('$value > 5'), 0;

is_deeply $data->any('$value > 3'), 1;

ok 1 and done_testing;
