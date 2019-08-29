use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Regexp::Func::Eq

=abstract

Data-Object Regexp Function (Eq) Class

=synopsis

  use Data::Object::Regexp::Func::Eq;

  my $func = Data::Object::Regexp::Func::Eq->new(@args);

  $func->execute;

=description

Data::Object::Regexp::Func::Eq is a function object for Data::Object::Regexp.

=cut

# TESTING

use_ok 'Data::Object::Regexp::Func::Eq';

ok 1 and done_testing;
