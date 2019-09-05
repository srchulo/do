use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object::Regexp

=abstract

Data-Object Regexp Class

=synopsis

  use Data::Object::Regexp;

  my $re = Data::Object::Regexp->new(qr(\w+));

=inherits

Data::Object::Regexp::Base

=integrates

Data::Object::Role::Detract
Data::Object::Role::Dumper
Data::Object::Role::Functable
Data::Object::Role::Output
Data::Object::Role::Throwable

=description

This package provides routines for operating on Perl 5 regular expressions.

=cut

use_ok "Data::Object::Regexp";

ok 1 and done_testing;
