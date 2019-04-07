use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

each_key

=usage

  # given {1..8}

  $hash->each_key(sub{
      my $key = shift; # 1
  });

=description

The each_key method iterates over each element in the hash, executing the code
reference supplied in the argument, passing the routine the key at the current
position in the loop. This method supports codification, i.e, takes an argument
which can be a codifiable string, a code reference, or a code data type object.
This method returns a L<Data::Object::Hash> object.

=signature

each(CodeRef $arg1, Any @args) : Any

=type

method

=cut

# TESTING

use_ok 'Data::Object::Hash';

my $data = Data::Object::Hash->new({1..4});

is_deeply $data->each_key(sub { [@_] }), $data;

ok 1 and done_testing;
