use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

name

=usage

  my $name = $self->name();

=description

The name method returns the name of the data type.

=signature

name() : DoStr

=type

method

=cut

# TESTING

use_ok 'Data::Object::Type::Undef';

my $data = Data::Object::Type::Undef->new();

is_deeply $data->name(), 'DoUndef';

ok 1 and done_testing;
