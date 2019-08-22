use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object::Autobox

=abstract

Data-Object Autoboxing

=synopsis

  use Data::Object::Autobox;

  my $input  = [1,1,1,1,3,3,2,1,5,6,7,8,9];
  my $output = $input->grep(sub{$_[0] < 5})->unique->sort; # [1,2,3]
  my $object = $output->array;

  $output->join(',')->print; # 1,2,3
  $object->join(',')->print; # 1,2,3

  $object->isa('Data::Object::Array');

=description

This package implements autoboxing via L<autobox> to provide
L<boxing|http://en.wikipedia.org/wiki/Object_type_(object-oriented_programming)>
for native Perl 5 data types. This functionality is provided by L<Data::Object>
which provides a collection of object classes for handling SCALAR, ARRAY, HASH,
CODE, INTEGER, FLOAT, NUMBER, STRING, UNDEF, and other data type operations.

Data::Object provides its own boxing strategy in that every method call which
would normally return a native data type will return a data type object, but
this functionality requires an initial data type object. Data::Object::Autobox
makes it so that you do not need to explicitly create the initial data type
object, and once the initial autobox method call is made, the Data::Object
boxing takes over.

=cut

use_ok "Data::Object::Autobox";

ok 1 and done_testing;
