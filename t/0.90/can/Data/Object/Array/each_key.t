use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

each_key

=usage

  # given ['a'..'g']

  $array->each_key(sub{
      my $index = shift; # 0
      ...
  });

=description

The each_key method iterates over each element in the array, executing the
code reference supplied in the argument, passing the routine the index at the
current position in the loop. This method supports codification, i.e, takes an
argument which can be a codifiable string, a code reference, or a code data type
object. This method returns a L<Data::Object::Array> object.

=signature

each_key(CodeRef $arg1, Any @args) : Object

=type

method

=cut

# TESTING

use_ok 'Data::Object::Array';

my $data = Data::Object::Array->new(['a'..'g']);

is_deeply $data->each_key(sub { [@_] }), $data;

ok 1 and done_testing;
