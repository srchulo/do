use strict;
use warnings;
use Test::More;

use_ok 'Data::Object::Export';

subtest 'test module' => sub {
  can_ok 'Data::Object::Export' => qw(
    load
    data_array
    data_code
    data_float
    data_hash
    data_number
    data_scalar
    data_string
    data_undef
    deduce
    deduce_deep
    detract
    detract_deep
    type_array
    type_code
    type_float
    type_hash
    type_number
    type_scalar
    type_string
    type_undef
  );
};

ok 1 and done_testing;
