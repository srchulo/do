package Data::Object::Autobox;

use 5.014;

use strict;
use warnings;

use base 'autobox';

require Data::Object::Array::Autobox;
require Data::Object::Code::Autobox;
require Data::Object::Float::Autobox;
require Data::Object::Hash::Autobox;
require Data::Object::Number::Autobox;
require Data::Object::Scalar::Autobox;
require Data::Object::String::Autobox;
require Data::Object::Undef::Autobox;

# VERSION

sub import {
  my ($class) = @_;

  $class->SUPER::import(
    ARRAY     => 'Data::Object::Array::Autobox',
    CODE      => 'Data::Object::Code::Autobox',
    FLOAT     => 'Data::Object::Float::Autobox',
    HASH      => 'Data::Object::Hash::Autobox',
    INTEGER   => 'Data::Object::Number::Autobox',
    NUMBER    => 'Data::Object::Number::Autobox',
    SCALAR    => 'Data::Object::Scalar::Autobox',
    STRING    => 'Data::Object::String::Autobox',
    UNDEF     => 'Data::Object::Undef::Autobox',
    UNIVERSAL => 'Data::Object::Scalar::Autobox'
  );

  return $class;
}

1;
