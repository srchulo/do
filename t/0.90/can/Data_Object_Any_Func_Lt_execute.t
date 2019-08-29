use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

execute

=usage

  my $data = Data::Object::Any->new(sub {1});

  my $func = Data::Object::Any::Func::Lt->new(
    arg1 => $data,
    arg2 => ''
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
use Data::Object::Any::Func::Lt;

can_ok "Data::Object::Any::Func::Lt", "execute";

my $data;
my $func;

$data = Data::Object::Any->new(sub {1});
$func = Data::Object::Any::Func::Lt->new(
  arg1 => $data,
  arg2 => ''
);

ok !eval { $func->execute } && $@ =~ m{ not supported };

ok 1 and done_testing;
