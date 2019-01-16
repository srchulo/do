use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Config::Undef';

can_ok 'Data::Object::Config::Undef', 'defined';
can_ok 'Data::Object::Config::Undef', 'eq';
can_ok 'Data::Object::Config::Undef', 'gt';
can_ok 'Data::Object::Config::Undef', 'ge';
can_ok 'Data::Object::Config::Undef', 'lt';
can_ok 'Data::Object::Config::Undef', 'le';
can_ok 'Data::Object::Config::Undef', 'ne';

ok 1 and done_testing;
