use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Export::Universal';

can_ok 'Data::Object::Export::Universal', 'defined';
can_ok 'Data::Object::Export::Universal', 'eq';
can_ok 'Data::Object::Export::Universal', 'gt';
can_ok 'Data::Object::Export::Universal', 'ge';
can_ok 'Data::Object::Export::Universal', 'lt';
can_ok 'Data::Object::Export::Universal', 'le';
can_ok 'Data::Object::Export::Universal', 'ne';

ok 1 and done_testing;
