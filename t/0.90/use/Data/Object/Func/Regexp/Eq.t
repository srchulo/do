use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Func::Regexp::Eq

=abstract

Data-Object Regexp Function (Eq) Class

=synopsis

  use Data::Object::Func::Regexp::Eq;

  my $func = Data::Object::Func::Regexp::Eq->new(@args);

  $func->execute;

=description

Data::Object::Func::Regexp::Eq is a function object for Data::Object::Regexp.

=cut

# TESTING

use_ok 'Data::Object::Func::Regexp::Eq';

ok 1 and done_testing;
