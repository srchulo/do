use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::String';
can_ok 'Data::Object::String', 'pretty_dump';

subtest 'test the pretty_dump method' => sub {
  my $string = Data::Object::String->new('abcdefghi');
  is $string->pretty_dump, "abcdefghi\n";
};

ok 1 and done_testing;
