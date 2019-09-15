use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Hash';
can_ok 'Data::Object::Hash', 'pretty_dump';

subtest 'test the pretty_dump method' => sub {
  my $hash = Data::Object::Hash->new({1, 2, 3, 4});
  is $hash->pretty_dump, q{{
  1 => 2,
  3 => 4,
}
}
};

ok 1 and done_testing;
