use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Func::String::Hex

=abstract

Data-Object String Function (Hex) Class

=synopsis

  use Data::Object::Func::String::Hex;

  my $func = Data::Object::Func::String::Hex->new(@args);

  $func->execute;

=description

Data::Object::Func::String::Hex is a function object for Data::Object::String.

=cut

# TESTING

use_ok 'Data::Object::Func::String::Hex';

ok 1 and done_testing;