use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Number';
# deprecated
# can_ok 'Data::Object::Number', 'to';

use Scalar::Util 'refaddr';

subtest 'test the to method' => sub {
  my $number = Data::Object::Number->new(-5);
  my $to     = $number->to(5);

  isnt refaddr($number), refaddr($to);
  is_deeply $to, [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];

  isa_ok $number, 'Data::Object::Number';
  isa_ok $to,     'Data::Object::Array';
};

subtest 'test the to method - ascending' => sub {
  my $number = Data::Object::Number->new(0);
  my $to     = $number->to(5);

  isnt refaddr($number), refaddr($to);
  is_deeply $to, [0, 1, 2, 3, 4, 5];

  isa_ok $number, 'Data::Object::Number';
  isa_ok $to,     'Data::Object::Array';
};

subtest 'test the to method - descending' => sub {
  my $number = Data::Object::Number->new(5);
  my $to     = $number->to(0);

  isnt refaddr($number), refaddr($to);
  is_deeply $to, [5, 4, 3, 2, 1, 0];

  isa_ok $number, 'Data::Object::Number';
  isa_ok $to,     'Data::Object::Array';
};

ok 1 and done_testing;
