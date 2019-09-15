use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Array';
can_ok 'Data::Object::Array', 'pretty_dump';

subtest 'test the pretty_dump method' => sub {
  my $array = Data::Object::Array->new([1, 2, 3, 4, 5]);
  is $array->pretty_dump, q{[
  1,
  2,
  3,
  4,
  5,
]
}
};

ok 1 and done_testing;
