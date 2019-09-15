use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Undef';
can_ok 'Data::Object::Undef', 'pretty_dump';

subtest 'test the pretty_dump method' => sub {
  my $undef = Data::Object::Undef->new(undef);
  is $undef->pretty_dump, "undef\n";
};

ok 1 and done_testing;
