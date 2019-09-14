package Data::Object::String;

use 5.014;

use strict;
use warnings;

use Role::Tiny::With;

use overload (
  '""'     => 'detract',
  '~~'     => 'detract',
  fallback => 1
);

with qw(
  Data::Object::Role::Dumpable
  Data::Object::Role::Functable
  Data::Object::Role::Throwable
);

use parent 'Data::Object::String::Base';

# VERSION

1;
