use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

roles

=usage

  # given $hash

  $hash->roles;

=description

The roles method returns the list of roles attached to object. This method
returns a L<Data::Object::Array> object.

=signature

roles() : ArrayRef

=type

method

=cut

# TESTING

use_ok 'Data::Object::Hash';

my $data = Data::Object::Hash->new({1..4});

my $roles = $data->roles();

is_deeply $roles->[0], 'Data::Object::Role::Detract';

is_deeply $roles->[1], 'Data::Object::Role::Dumper';

is_deeply $roles->[2], 'Data::Object::Role::Output';

is_deeply $roles->[3], 'Data::Object::Role::Throwable';

is_deeply $roles->[4], 'Data::Object::Role::Type';

ok 1 and done_testing;
