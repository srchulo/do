use lib 't/0.01/lib';

use Test::More;

use Data::Object::Signatures ':strict' => qw(MyApp::Types);
use Data::Object::Export qw(deduce);
use Data::Object::Registry;

fun greeting (AllCaps $name) {
  return "hello, $name";
}

fun meeting (NumObj :$epoch = $$) {
  return "our meeting is at $epoch";
}

is greeting(deduce('MARTIAN')), 'hello, MARTIAN';
ok !eval { greeting(deduce('martian')) };
ok $@;

is meeting(epoch => deduce $$), 'our meeting is at ' . $$;
ok !eval { meeting(epocj => deduce $$) };
ok $@;

ok 1 and done_testing;
