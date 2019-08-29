use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::Hash->new({1..8});

  my $func = Data::Object::Hash::Func::FilterInclude->new(
    arg1 => $data,
    args => [1,3]
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
use Data::Object::Hash::Func::FilterInclude;

can_ok "Data::Object::Hash::Func::FilterInclude", "execute";

my $data;
my $func;

$data = Data::Object::Hash->new({1..8});
$func = Data::Object::Hash::Func::FilterInclude->new(
  arg1 => $data,
  args => [1,3]
);

my $result = $func->execute;

is_deeply $result, {1=>2,3=>4};

ok 1 and done_testing;
