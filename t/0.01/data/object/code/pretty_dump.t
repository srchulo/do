use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Code';
can_ok 'Data::Object::Code', 'pretty_dump';

subtest 'test the pretty_dump method' => sub {
  my $code = Data::Object::Code->new(sub {1});
  my $dump = $code->pretty_dump;
  like $dump, qr/sub.*\n\s+package.*Data::Object.*;\n.*goto \$data/s;
};

ok 1 and done_testing;
