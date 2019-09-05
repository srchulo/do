package Data::Object::Rule::List;

use 5.014;

use strict;
use warnings;

use Moo::Role;

# VERSION

requires 'grep';
requires 'head';
requires 'join';
requires 'length';
requires 'list';
requires 'map';
requires 'reverse';
requires 'sort';
requires 'tail';
requires 'values';

1;