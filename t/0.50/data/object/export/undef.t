use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Export::Undef';

can_ok 'Data::Object::Export::Undef', 'defined';
can_ok 'Data::Object::Export::Undef', 'eq';
can_ok 'Data::Object::Export::Undef', 'gt';
can_ok 'Data::Object::Export::Undef', 'ge';
can_ok 'Data::Object::Export::Undef', 'lt';
can_ok 'Data::Object::Export::Undef', 'le';
can_ok 'Data::Object::Export::Undef', 'ne';

ok 1 and done_testing;
