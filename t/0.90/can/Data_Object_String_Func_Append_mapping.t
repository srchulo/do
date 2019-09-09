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

use Data::Object::String::Func::Append;

can_ok "Data::Object::String::Func::Append", "mapping";

my @data;

@data = Data::Object::String::Func::Append->mapping();

is @data, 2;

is $data[0], 'arg1';
is $data[1], '@args';

ok 1 and done_testing;