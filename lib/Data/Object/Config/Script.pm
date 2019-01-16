# ABSTRACT: Exportable Script Functions for Perl 5
package Data::Object::Config::Script;

use 5.014;

use strict;
use warnings;

use Data::Object::Config ':core', ':plus', ':vars';

use parent 'Exporter';

# VERSION

our @EXPORT = (
  @Data::Object::Config::CORE,
  @Data::Object::Config::PLUS,
  @Data::Object::Config::VARS
);

$dispatch = deduce $dispatch;

1;
