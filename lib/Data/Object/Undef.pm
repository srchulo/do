package Data::Object::Undef;

use 5.014;

use strict;
use warnings;

use Role::Tiny::With;

use overload (
  '""'     => 'detract',
  '0+'     => 'detract',
  'bool'   => 'detract',
  '~~'     => 'detract',
  fallback => 1
);

with qw(
  Data::Object::Role::Detract
  Data::Object::Role::Dumper
  Data::Object::Role::Functable
  Data::Object::Role::Output
  Data::Object::Role::Throwable
);

use parent 'Data::Object::Undef::Base';

# VERSION

# METHODS

1;
