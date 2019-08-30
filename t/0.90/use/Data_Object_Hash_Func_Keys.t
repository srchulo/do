use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Hash::Func::Keys

=abstract

Data-Object Hash Function (Keys) Class

=synopsis

  use Data::Object::Hash::Func::Keys;

  my $func = Data::Object::Hash::Func::Keys->new(@args);

  $func->execute;

=description

Data::Object::Hash::Func::Keys is a function object for Data::Object::Hash.
This package inherits all behavior from L<Data::Object::Hash::Func>.

=cut

# TESTING

use_ok 'Data::Object::Hash::Func::Keys';

ok 1 and done_testing;
