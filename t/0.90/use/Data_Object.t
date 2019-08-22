use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object

=abstract

Modern Perl Development Framework and Standard Library

=synopsis

  package User;

  use Data::Object 'Class';

  extends 'Identity';

  has 'fname';
  has 'lname';

  1;

=description

The Data::Object package and framework aims to provide a standardized and
cohesive set of classes, types, objects, functions, patterns, and tools for
jump-starting application development with modern conventions and best
practices.

=cut

use_ok 'Data::Object';

ok 1 and done_testing;
