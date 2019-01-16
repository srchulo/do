use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Config::Code';

can_ok 'Data::Object::Config::Code', 'call';
can_ok 'Data::Object::Config::Code', 'compose';
can_ok 'Data::Object::Config::Code', 'conjoin';
can_ok 'Data::Object::Config::Code', 'curry';
can_ok 'Data::Object::Config::Code', 'defined';
can_ok 'Data::Object::Config::Code', 'disjoin';
can_ok 'Data::Object::Config::Code', 'next';
can_ok 'Data::Object::Config::Code', 'rcurry';

ok 1 and done_testing;
