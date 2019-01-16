use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Role::Any';

can_ok 'Data::Object::Role::Any', 'data';
can_ok 'Data::Object::Role::Any', 'defined';
can_ok 'Data::Object::Role::Any', 'detract';
can_ok 'Data::Object::Role::Any', 'dump';
can_ok 'Data::Object::Role::Any', 'eq';
can_ok 'Data::Object::Role::Any', 'ge';
can_ok 'Data::Object::Role::Any', 'gt';
can_ok 'Data::Object::Role::Any', 'le';
can_ok 'Data::Object::Role::Any', 'lt';
can_ok 'Data::Object::Role::Any', 'methods';
can_ok 'Data::Object::Role::Any', 'ne';
can_ok 'Data::Object::Role::Any', 'print';
can_ok 'Data::Object::Role::Any', 'roles';
can_ok 'Data::Object::Role::Any', 'say';
can_ok 'Data::Object::Role::Any', 'throw';
can_ok 'Data::Object::Role::Any', 'type';

ok 1 and done_testing;
