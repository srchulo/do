use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Export::Number';

can_ok 'Data::Object::Export::Number', 'abs';
can_ok 'Data::Object::Export::Number', 'atan2';
can_ok 'Data::Object::Export::Number', 'cos';
can_ok 'Data::Object::Export::Number', 'decr';
can_ok 'Data::Object::Export::Number', 'defined';
can_ok 'Data::Object::Export::Number', 'exp';
can_ok 'Data::Object::Export::Number', 'hex';
can_ok 'Data::Object::Export::Number', 'incr';
can_ok 'Data::Object::Export::Number', 'int';
can_ok 'Data::Object::Export::Number', 'log';
can_ok 'Data::Object::Export::Number', 'mod';
can_ok 'Data::Object::Export::Number', 'neg';
can_ok 'Data::Object::Export::Number', 'pow';
can_ok 'Data::Object::Export::Number', 'sin';
can_ok 'Data::Object::Export::Number', 'sqrt';

ok 1 and done_testing;
