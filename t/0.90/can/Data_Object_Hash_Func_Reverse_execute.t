use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::Hash->new({1..4});

  my $func = Data::Object::Hash::Func::Reverse->new(
    arg1 => $data
  );

  my $result = $func->execute;

=description

Executes the function logic and returns the result.

=signature

execute() : Object

=type

method

=cut

# TESTING

use Data::Object::Hash;
use Data::Object::Hash::Func::Reverse;

can_ok "Data::Object::Hash::Func::Reverse", "execute";

my $data;
my $func;

$data = Data::Object::Hash->new({1..4});
$func = Data::Object::Hash::Func::Reverse->new(
  arg1 => $data
);

my $result = $func->execute;

is_deeply $result, {2=>1, 4=>3};

ok 1 and done_testing;
