use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object::Any::Autobox

=abstract

Data-Object Autoboxing for Any Objects

=synopsis

  use Data::Object::Any::Autobox;

=description

This package implements autoboxing via L<Data::Object::Autobox> for
L<Data::Object::Any> objects.

+=head1 ROLES

This package assumes all behavior from the follow roles:

L<Data::Object::Role::Proxyable>

=cut

use_ok "Data::Object::Any::Autobox";

ok 1 and done_testing;
