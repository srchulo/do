use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::String';
# deprecated
# can_ok 'Data::Object::String', 'trim';

use Scalar::Util 'refaddr';

subtest 'test the trim method' => sub {
  my $string  = Data::Object::String->new(' system is   ready   ');
  my $trimmed = $string->trim;

  isnt refaddr($string), refaddr($trimmed);
  is "$trimmed", 'system is   ready';

  isa_ok $string,  'Data::Object::String';
  isa_ok $trimmed, 'Data::Object::String';
};

ok 1 and done_testing;
