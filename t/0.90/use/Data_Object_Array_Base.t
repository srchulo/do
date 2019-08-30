use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object::Array::Base

=abstract

Data-Object Abstract Array Class

=synopsis

  use Data::Object::Array::Base;

  my $array = Data::Object::Array::Base->new([1..9]);

=description

Data::Object::Array::Base provides routines for operating on Perl 5 array
references. This package inherits all behavior from L<Data::Object::Base>.

=cut

use_ok "Data::Object::Array::Base";

ok 1 and done_testing;
