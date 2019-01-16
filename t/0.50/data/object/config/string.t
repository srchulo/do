use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Config::String';

can_ok 'Data::Object::Config::String', 'append';
can_ok 'Data::Object::Config::String', 'camelcase';
can_ok 'Data::Object::Config::String', 'chomp';
can_ok 'Data::Object::Config::String', 'chop';
can_ok 'Data::Object::Config::String', 'concat';
can_ok 'Data::Object::Config::String', 'contains';
can_ok 'Data::Object::Config::String', 'defined';
can_ok 'Data::Object::Config::String', 'hex';
can_ok 'Data::Object::Config::String', 'index';
can_ok 'Data::Object::Config::String', 'lc';
can_ok 'Data::Object::Config::String', 'lcfirst';
can_ok 'Data::Object::Config::String', 'length';
can_ok 'Data::Object::Config::String', 'lines';
can_ok 'Data::Object::Config::String', 'lowercase';
can_ok 'Data::Object::Config::String', 'replace';
can_ok 'Data::Object::Config::String', 'reverse';
can_ok 'Data::Object::Config::String', 'rindex';
can_ok 'Data::Object::Config::String', 'snakecase';
can_ok 'Data::Object::Config::String', 'split';
can_ok 'Data::Object::Config::String', 'strip';
can_ok 'Data::Object::Config::String', 'titlecase';
can_ok 'Data::Object::Config::String', 'trim';
can_ok 'Data::Object::Config::String', 'uc';
can_ok 'Data::Object::Config::String', 'ucfirst';
can_ok 'Data::Object::Config::String', 'uppercase';
can_ok 'Data::Object::Config::String', 'words';

ok 1 and done_testing;
