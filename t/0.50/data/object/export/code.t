use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Export::Code';

can_ok 'Data::Object::Export::Code', 'call';
can_ok 'Data::Object::Export::Code', 'compose';
can_ok 'Data::Object::Export::Code', 'conjoin';
can_ok 'Data::Object::Export::Code', 'curry';
can_ok 'Data::Object::Export::Code', 'defined';
can_ok 'Data::Object::Export::Code', 'disjoin';
can_ok 'Data::Object::Export::Code', 'next';
can_ok 'Data::Object::Export::Code', 'rcurry';

ok 1 and done_testing;
