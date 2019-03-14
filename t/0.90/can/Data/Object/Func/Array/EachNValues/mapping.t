use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

mapping

=usage

  my @data = $self->mapping;

=description

Returns the ordered list of named function object arguments.

=signature

mapping() : (Str)

=type

method

=cut

# TESTING

use Data::Object::Func::Array::EachNValues;

can_ok "Data::Object::Func::Array::EachNValues", "mapping";

my @data;

@data = Data::Object::Func::Array::EachNValues->mapping();

is @data, 4;

is $data[0], 'arg1';
is $data[1], 'arg2';
is $data[2], 'arg3';
is $data[3], '@args';

ok 1 and done_testing;