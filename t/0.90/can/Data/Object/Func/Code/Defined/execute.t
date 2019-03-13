use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::Code->new(sub { [@_] });

  my $func = Data::Object::Func::Code::Defined->new(
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

use Data::Object::Code;
use Data::Object::Func::Code::Defined;

can_ok "Data::Object::Func::Code::Defined", "execute";

my $data;
my $func;

$data = Data::Object::Code->new(sub { [@_] });
$func = Data::Object::Func::Code::Defined->new(
  arg1 => $data
);

my $result = $func->execute;

is_deeply $result, 1;

ok 1 and done_testing;
