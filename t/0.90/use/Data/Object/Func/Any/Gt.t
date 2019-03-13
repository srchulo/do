use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Func::Any::Gt

=abstract

Data-Object Any Function (Gt) Class

=synopsis

  use Data::Object::Func::Any::Gt;

  my $func = Data::Object::Func::Any::Gt->new(@args);

  $func->execute;

=description

Data::Object::Func::Any::Gt is a function object for Data::Object::Any.

=cut

# TESTING

use_ok 'Data::Object::Func::Any::Gt';

ok 1 and done_testing;
