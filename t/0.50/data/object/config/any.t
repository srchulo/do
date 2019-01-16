use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Config::Any';

can_ok 'Data::Object::Config::Any', 'defined';
can_ok 'Data::Object::Config::Any', 'eq';
can_ok 'Data::Object::Config::Any', 'gt';
can_ok 'Data::Object::Config::Any', 'ge';
can_ok 'Data::Object::Config::Any', 'lt';
can_ok 'Data::Object::Config::Any', 'le';
can_ok 'Data::Object::Config::Any', 'ne';

ok 1 and done_testing;
