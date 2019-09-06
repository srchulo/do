use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Number::Func::Exp

=abstract

Data-Object Number Function (Exp) Class

=synopsis

  use Data::Object::Number::Func::Exp;

  my $func = Data::Object::Number::Func::Exp->new(@args);

  $func->execute;

=inherits

Data::Object::Number::Func

=attributes

arg1(Object, req, ro)

=libraries

Data::Object::Library

=description

Data::Object::Number::Func::Exp is a function object for Data::Object::Number.

=cut

# TESTING

use_ok 'Data::Object::Number::Func::Exp';

ok 1 and done_testing;
