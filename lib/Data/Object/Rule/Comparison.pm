package Data::Object::Rule::Comparison;

use 5.014;

use strict;
use warnings;

use Moo::Role;

# VERSION

requires 'eq';
requires 'gt';
requires 'ge';
requires 'lt';
requires 'le';
requires 'ne';

1;