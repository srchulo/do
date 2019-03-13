use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::String';

ok Data::Object::String->does('Data::Object::Rule::Comparison');
ok Data::Object::String->does('Data::Object::Rule::Defined');
ok Data::Object::String->does('Data::Object::Role::Detract');
ok Data::Object::String->does('Data::Object::Role::Dumper');
ok Data::Object::String->does('Data::Object::Role::Output');
ok Data::Object::String->does('Data::Object::Role::Throwable');
ok Data::Object::String->does('Data::Object::Role::Type');

# no longer supported
# ok Data::Object::String->does('Data::Object::Role::Value');

can_ok 'Data::Object::String', 'append';
can_ok 'Data::Object::String', 'camelcase';
can_ok 'Data::Object::String', 'chomp';
can_ok 'Data::Object::String', 'chop';
can_ok 'Data::Object::String', 'concat';
can_ok 'Data::Object::String', 'contains';
can_ok 'Data::Object::String', 'data';
can_ok 'Data::Object::String', 'defined';
can_ok 'Data::Object::String', 'detract';
can_ok 'Data::Object::String', 'dump';
can_ok 'Data::Object::String', 'eq';
can_ok 'Data::Object::String', 'ge';
can_ok 'Data::Object::String', 'gt';
can_ok 'Data::Object::String', 'hex';
can_ok 'Data::Object::String', 'index';
can_ok 'Data::Object::String', 'lc';
can_ok 'Data::Object::String', 'lcfirst';
can_ok 'Data::Object::String', 'le';
can_ok 'Data::Object::String', 'length';
can_ok 'Data::Object::String', 'lines';
can_ok 'Data::Object::String', 'lowercase';
can_ok 'Data::Object::String', 'lt';
can_ok 'Data::Object::String', 'methods';
can_ok 'Data::Object::String', 'ne';
can_ok 'Data::Object::String', 'new';
can_ok 'Data::Object::String', 'print';
can_ok 'Data::Object::String', 'replace';
can_ok 'Data::Object::String', 'reverse';
can_ok 'Data::Object::String', 'rindex';
can_ok 'Data::Object::String', 'roles';
can_ok 'Data::Object::String', 'say';
can_ok 'Data::Object::String', 'snakecase';
can_ok 'Data::Object::String', 'split';
can_ok 'Data::Object::String', 'strip';
can_ok 'Data::Object::String', 'throw';
can_ok 'Data::Object::String', 'titlecase';
can_ok 'Data::Object::String', 'trim';
can_ok 'Data::Object::String', 'type';
can_ok 'Data::Object::String', 'uc';
can_ok 'Data::Object::String', 'ucfirst';
can_ok 'Data::Object::String', 'uppercase';
can_ok 'Data::Object::String', 'words';

ok 1 and done_testing;
