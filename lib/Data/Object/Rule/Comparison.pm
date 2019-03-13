package Data::Object::Rule::Comparison;

use strict;
use warnings;

use Data::Object::Rule;

# BUILD

requires 'eq';
requires 'gt';
requires 'ge';
requires 'lt';
requires 'le';
requires 'ne';

# METHODS

1;