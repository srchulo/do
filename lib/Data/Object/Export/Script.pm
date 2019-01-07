# ABSTRACT: Exportable Script Functions for Perl 5
package Data::Object::Export::Script;

use 5.014;

use strict;
use warnings;

use Data::Object::Export ':core', ':plus', ':vars';

use parent 'Exporter';

# VERSION

our @EXPORT = (
  @Data::Object::Export::CORE,
  @Data::Object::Export::PLUS,
  @Data::Object::Export::VARS
);

$dispatch = deduce $dispatch;

1;
