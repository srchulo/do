use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Number';
can_ok 'Data::Object::Number', 'pretty_dump';

subtest 'test the pretty_dump method' => sub {
  my $number = Data::Object::Number->new(12345);
  is $number->pretty_dump, "12345\n";
};

ok 1 and done_testing;
