use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

rules

=usage

  my $rules = $scalar->rules;

=description

The rules method returns consumed rules.

=signature

rules() : ArrayRef

=type

method

=cut

# TESTING

use_ok 'Data::Object::Scalar';

my $data = Data::Object::Scalar->new(12345);

my $rules = $data->rules();

is_deeply $rules->[0], 'Data::Object::Rule::Comparison';

is_deeply $rules->[1], 'Data::Object::Rule::Defined';

ok 1 and done_testing;