use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Hash';
# deprecated
# can_ok 'Data::Object::Hash', 'each_value';

use Scalar::Util 'refaddr';

subtest 'test the each_value method' => sub {
  my $hash = Data::Object::Hash->new({1 .. 8});

  my $values     = [];
  my @argument   = (sub { push @$values, shift; });
  my $each_value = $hash->each_value(@argument);

  # deprecated
  # is refaddr($hash), refaddr($each_value);

  is_deeply $each_value, [1,2,3,4];
  is_deeply [sort @{$values}], [sort values %{$hash}];

  isa_ok $hash,       'Data::Object::Hash';
  isa_ok $each_value, 'Data::Object::Array';
};

ok 1 and done_testing;
