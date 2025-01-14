use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

regexp

=usage

  my $regexp = $result->regexp();

=description

The regexp method returns the regular expression used to perform the match from
the result object which contains information about the results of the regular
expression operation.

=signature

regexp() : RegexpObject

=type

method

=cut

# TESTING

use_ok 'Data::Object::Search';

my $data = Data::Object::Search->new([''.qr(test).'', 'best case', 1, [ '0' ], [ '4' ], {}, 'test case']);

is_deeply $data->regexp(), ''.qr(test).'';

ok 1 and done_testing;
