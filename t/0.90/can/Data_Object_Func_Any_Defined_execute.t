use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::Any->new(sub {1});

  my $func = Data::Object::Func::Any::Defined->new(
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

use Data::Object::Any;
use Data::Object::Func::Any::Defined;

can_ok "Data::Object::Func::Any::Defined", "execute";

my $data;
my $func;

$data = Data::Object::Any->new(sub {1});
$func = Data::Object::Func::Any::Defined->new(
  arg1 => $data
);

my $result = $func->execute;

is_deeply $result, 1;

ok 1 and done_testing;