use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

rules

=usage

  my $rules = $array->rules();

=description

The rules method returns consumed rules.

=signature

rules() : ArrayRef

=type

method

=cut

# TESTING

use_ok 'Data::Object::Array';

my $data = Data::Object::Array->new([1..5]);

my $rules = $data->rules();

is_deeply $rules->[0], 'Data::Object::Rule::Collection';

is_deeply $rules->[1], 'Data::Object::Rule::Comparison';

is_deeply $rules->[2], 'Data::Object::Rule::Defined';

is_deeply $rules->[3], 'Data::Object::Rule::List';

ok 1 and done_testing;