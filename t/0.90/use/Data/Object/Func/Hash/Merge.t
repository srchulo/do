use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

Data::Object::Func::Hash::Merge

=abstract

Data-Object Hash Function (Merge) Class

=synopsis

  use Data::Object::Func::Hash::Merge;

  my $func = Data::Object::Func::Hash::Merge->new(@args);

  $func->execute;

=description

Data::Object::Func::Hash::Merge is a function object for Data::Object::Hash.

=cut

# TESTING

use_ok 'Data::Object::Func::Hash::Merge';

ok 1 and done_testing;
