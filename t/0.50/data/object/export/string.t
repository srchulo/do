use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Export::String';

can_ok 'Data::Object::Export::String', 'append';
can_ok 'Data::Object::Export::String', 'camelcase';
can_ok 'Data::Object::Export::String', 'chomp';
can_ok 'Data::Object::Export::String', 'chop';
can_ok 'Data::Object::Export::String', 'concat';
can_ok 'Data::Object::Export::String', 'contains';
can_ok 'Data::Object::Export::String', 'defined';
can_ok 'Data::Object::Export::String', 'hex';
can_ok 'Data::Object::Export::String', 'index';
can_ok 'Data::Object::Export::String', 'lc';
can_ok 'Data::Object::Export::String', 'lcfirst';
can_ok 'Data::Object::Export::String', 'length';
can_ok 'Data::Object::Export::String', 'lines';
can_ok 'Data::Object::Export::String', 'lowercase';
can_ok 'Data::Object::Export::String', 'replace';
can_ok 'Data::Object::Export::String', 'reverse';
can_ok 'Data::Object::Export::String', 'rindex';
can_ok 'Data::Object::Export::String', 'snakecase';
can_ok 'Data::Object::Export::String', 'split';
can_ok 'Data::Object::Export::String', 'strip';
can_ok 'Data::Object::Export::String', 'titlecase';
can_ok 'Data::Object::Export::String', 'trim';
can_ok 'Data::Object::Export::String', 'uc';
can_ok 'Data::Object::Export::String', 'ucfirst';
can_ok 'Data::Object::Export::String', 'uppercase';
can_ok 'Data::Object::Export::String', 'words';

ok 1 and done_testing;
