package Data::Object::Rule::Collection;

use 5.014;

use strict;
use warnings;

use Data::Object::Rule;

# VERSION

requires 'each';
requires 'each_key';
requires 'each_n_values';
requires 'each_value';
requires 'exists';
requires 'invert';
requires 'iterator';
requires 'list';
requires 'keys';
requires 'get';
requires 'set';
requires 'slice';
requires 'values';

1;