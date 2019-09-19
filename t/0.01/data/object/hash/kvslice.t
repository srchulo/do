use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Hash';
# deprecated
# can_ok 'Data::Object::Hash', 'slice';

use Scalar::Util 'refaddr';

subtest 'test the kvslice method' => sub {
  my $hash = Data::Object::Hash->new({1 .. 8});

  my @argument = (1, 3);
  my $kvslice  = $hash->kvslice(@argument);

  isnt refaddr($hash), refaddr($kvslice);
  is_deeply $kvslice, {1 => 2, 3 => 4};

  isa_ok $hash,  'Data::Object::Hash';
  isa_ok $kvslice, 'Data::Object::Hash';
};

ok 1 and done_testing;
