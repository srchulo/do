use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

pretty_dump

=usage

  my $pretty_dump = $self->pretty_dump();

=description

The pretty_dump method returns a string representation of the underlying data that is human-readable and
useful for debugging. The returned string includes a newline at the end.

=signature

  pretty_dump() : Str

=type

method

=cut

# TESTING

use_ok 'Data::Object::Role::Dumpable';

my $data = 'Data::Object::Role::Dumpable';

can_ok $data, 'pretty_dump';

ok 1 and done_testing;
