use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object::Role::Immutable

=abstract

Data-Object Immutability Role

=synopsis


  package Entity;

  use Data::Object 'Class';

  with 'Data::Object::Role::Immutable';

  has 'name';

  method BUILD($args) {
    $self->immutable;

    return $args;
  }

  1;

=description

This package provides a mechanism for making any L<Data::Object> data type
object immutable. An immutable object is an object whose state cannot be
modified after it is created; Immutable objects are often useful because they
are inherently thread-safe, easier to reason about, and offer higher security
than mutable objects.

=cut

use_ok "Data::Object::Role::Immutable";

ok 1 and done_testing;
