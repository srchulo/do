use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::Number->new(12345);

  my $func = Data::Object::Func::Number::Sin->new(
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

use Data::Object::Number;
use Data::Object::Func::Number::Sin;

can_ok "Data::Object::Func::Number::Sin", "execute";

my $data;
my $func;

$data = Data::Object::Number->new(12345);
$func = Data::Object::Func::Number::Sin->new(
  arg1 => $data
);

my $result = $func->execute;

is_deeply $result, -0.993771636455681;

ok 1 and done_testing;
