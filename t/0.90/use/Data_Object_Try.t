use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object::Try

=abstract

Data-Object Try/Catch Class

=synopsis

  use Data::Object::Try;

  my $try = Data::Object::Try->new;

  $try->call(fun (@args) {
    # try something

    return something
  });

  $try->catch($type, fun ($caught) {
    # caught an exception

    return $something;
  });

  $try->default(fun ($caught) {
    # catch the uncaught

    return $something;
  });

  $try->finally(fun (@args) {
    # always run after try/catch
  });

  my $result = $try->result(@args);

=description

This package provides an object-oriented interface for performing complex
try/catch operations.

=cut

use_ok "Data::Object::Try";

ok 1 and done_testing;
