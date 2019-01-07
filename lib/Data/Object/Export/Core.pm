# ABSTRACT: Exportable Core Functions for Perl 5
package Data::Object::Export::Core;

use 5.014;

use strict;
use warnings;

use Data::Object::Export ':core';

use parent 'Exporter';

# VERSION

our @EXPORT = @Data::Object::Export::CORE;

1;
