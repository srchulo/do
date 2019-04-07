use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::Hash->new({1..8,9,undef});

  my $func = Data::Object::Func::Hash::Delete->new(
    arg1 => $data,
    arg2 => 1
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
use Data::Object::Func::Hash::Delete;

can_ok "Data::Object::Func::Hash::Delete", "execute";

my $data;
my $func;

$data = Data::Object::Hash->new({1..8,9,undef});
$func = Data::Object::Func::Hash::Delete->new(
  arg1 => $data,
  arg2 => 1
);

my $result = $func->execute;

is_deeply $result, 2;

ok 1 and done_testing;