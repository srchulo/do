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

name() : StrObject

=type

method

=cut

# TESTING

use_ok 'Data::Object::Type::String';

my $data = Data::Object::Type::String->new();

is_deeply $data->name(), 'DoStr';

ok 1 and done_testing;