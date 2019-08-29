package Data::Object::Code;

use 5.014;

use strict;
use warnings;

use Role::Tiny::With;

use overload (
  '""'     => 'detract',
  '~~'     => 'detract',
  '&{}'    => 'self',
  fallback => 1
);

with qw(
  Data::Object::Role::Detract
  Data::Object::Role::Dumper
  Data::Object::Role::Functable
  Data::Object::Role::Throwable
);

use parent 'Data::Object::Code::Base';

# VERSION

# METHODS

sub self {
  return shift;
}

1;
