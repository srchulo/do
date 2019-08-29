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

use Data::Object::Regexp::Func::Ne;

can_ok "Data::Object::Regexp::Func::Ne", "mapping";

my @data;

@data = Data::Object::Regexp::Func::Ne->mapping();

is @data, 2;

is $data[0], 'arg1';
is $data[1], 'arg2';

ok 1 and done_testing;
