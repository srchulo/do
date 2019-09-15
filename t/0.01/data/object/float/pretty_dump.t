use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Float';
can_ok 'Data::Object::Float', 'pretty_dump';

subtest 'test the pretty_dump method' => sub {
  my $float = Data::Object::Float->new(3.99);
  is $float->pretty_dump, "3.99\n";
};

ok 1 and done_testing;
