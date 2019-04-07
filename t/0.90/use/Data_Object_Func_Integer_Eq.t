use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Func::Integer::Eq

=abstract

Data-Object Integer Function (Eq) Class

=synopsis

  use Data::Object::Func::Integer::Eq;

  my $func = Data::Object::Func::Integer::Eq->new(@args);

  $func->execute;

=description

Data::Object::Func::Integer::Eq is a function object for Data::Object::Integer.

=cut

# TESTING

use_ok 'Data::Object::Func::Integer::Eq';

ok 1 and done_testing;