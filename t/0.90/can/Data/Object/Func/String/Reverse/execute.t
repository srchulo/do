use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::String->new("hello world");

  my $func = Data::Object::Func::String::Reverse->new(
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

use Data::Object::String;
use Data::Object::Func::String::Reverse;

can_ok "Data::Object::Func::String::Reverse", "execute";

my $data;
my $func;

$data = Data::Object::String->new("hello world");
$func = Data::Object::Func::String::Reverse->new(
  arg1 => $data
);

my $result = $func->execute;

is_deeply $result, 'dlrow olleh';

ok 1 and done_testing;