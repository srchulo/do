use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Regexp::Func::Replace

=abstract

Data-Object Regexp Function (Replace) Class

=synopsis

  use Data::Object::Regexp::Func::Replace;

  my $func = Data::Object::Regexp::Func::Replace->new(@args);

  $func->execute;

=inherits

Data::Object::Regexp::Func

=attributes

arg1(Object, req, ro)
arg2(Str, req, ro)
arg3(Str, opt, ro)
arg4(Str, opt, ro)

=libraries

Data::Object::Library

=description

Data::Object::Regexp::Func::Replace is a function object for
Data::Object::Regexp.

=cut

# TESTING

use_ok 'Data::Object::Regexp::Func::Replace';

ok 1 and done_testing;