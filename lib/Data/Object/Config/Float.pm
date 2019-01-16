# ABSTRACT: Exportable Float Functions for Perl 5
package Data::Object::Config::Float;

use 5.014;

use strict;
use warnings;

use Data::Object 'codify', 'throw';

use parent 'Exporter::Tiny';

# VERSION

our @EXPORT_OK = (
  'defined'
);

sub defined {
  return 1;
}

1;
