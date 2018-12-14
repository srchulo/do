use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Hash';
can_ok 'Data::Object::Hash', 'clear';

use Scalar::Util 'refaddr';

subtest 'test the clear method' => sub {
  my $hash = Data::Object::Hash->new({1 .. 8});

  my @argument = ();
  my $clear    = $hash->clear(@argument);

  is refaddr($hash), refaddr($clear);
  is_deeply $clear, {};

  isa_ok $hash,  'Data::Object::Hash';
  isa_ok $clear, 'Data::Object::Hash';
};

ok 1 and done_testing;
