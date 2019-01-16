use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Config::Number';

can_ok 'Data::Object::Config::Number', 'abs';
can_ok 'Data::Object::Config::Number', 'atan2';
can_ok 'Data::Object::Config::Number', 'cos';
can_ok 'Data::Object::Config::Number', 'decr';
can_ok 'Data::Object::Config::Number', 'defined';
can_ok 'Data::Object::Config::Number', 'exp';
can_ok 'Data::Object::Config::Number', 'hex';
can_ok 'Data::Object::Config::Number', 'incr';
can_ok 'Data::Object::Config::Number', 'int';
can_ok 'Data::Object::Config::Number', 'log';
can_ok 'Data::Object::Config::Number', 'mod';
can_ok 'Data::Object::Config::Number', 'neg';
can_ok 'Data::Object::Config::Number', 'pow';
can_ok 'Data::Object::Config::Number', 'sin';
can_ok 'Data::Object::Config::Number', 'sqrt';

ok 1 and done_testing;
