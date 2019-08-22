package Data::Object::Autobox;

use 5.014;

use strict;
use warnings;

use base 'autobox';

require Data::Object::Autobox::Array;
require Data::Object::Autobox::Code;
require Data::Object::Autobox::Float;
require Data::Object::Autobox::Hash;
require Data::Object::Autobox::Integer;
require Data::Object::Autobox::Number;
require Data::Object::Autobox::Scalar;
require Data::Object::Autobox::String;
require Data::Object::Autobox::Undef;
require Data::Object::Autobox::Any;

# VERSION

sub import {
  my ($class) = @_;

  $class->SUPER::import(
    ARRAY     => 'Data::Object::Autobox::Array',
    CODE      => 'Data::Object::Autobox::Code',
    FLOAT     => 'Data::Object::Autobox::Float',
    HASH      => 'Data::Object::Autobox::Hash',
    INTEGER   => 'Data::Object::Autobox::Integer',
    NUMBER    => 'Data::Object::Autobox::Number',
    SCALAR    => 'Data::Object::Autobox::Scalar',
    STRING    => 'Data::Object::Autobox::String',
    UNDEF     => 'Data::Object::Autobox::Undef',
    UNIVERSAL => 'Data::Object::Autobox::Any'
  );

  return;
}

1;
