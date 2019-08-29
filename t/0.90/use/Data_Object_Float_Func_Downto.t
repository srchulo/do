use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Float::Func::Downto

=abstract

Data-Object Float Function (Downto) Class

=synopsis

  use Data::Object::Float::Func::Downto;

  my $func = Data::Object::Float::Func::Downto->new(@args);

  $func->execute;

=description

Data::Object::Float::Func::Downto is a function object for Data::Object::Float.

=cut

# TESTING

use_ok 'Data::Object::Float::Func::Downto';

ok 1 and done_testing;
