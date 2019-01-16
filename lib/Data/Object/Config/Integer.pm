# ABSTRACT: Exportable Integer Functions for Perl 5
package Data::Object::Config::Integer;

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
