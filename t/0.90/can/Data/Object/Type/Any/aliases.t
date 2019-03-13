use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

aliases

=usage

  my $aliases = $self->aliases();

=description

The aliases method returns aliases to register in the type library.

=signature

aliases() : ArrayRef

=type

method

=cut

# TESTING

use_ok 'Data::Object::Type::Any';

my $data = Data::Object::Type::Any->new();

is_deeply $data->aliases(), ['AnyObj', 'AnyObject'];

ok 1 and done_testing;
