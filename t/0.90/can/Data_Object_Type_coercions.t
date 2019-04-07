use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

coercions

=usage

  my $coercions = $data->coercions();

=description

The coercions method returns coercions to configure on the type constraint.

=signature

coercions() : ArrayRef

=type

method

=cut

# TESTING

use_ok 'Data::Object::Type';

my $data = Data::Object::Type->new();

can_ok $data, 'coercions';

ok 1 and done_testing;