package Data::Object::Autobox::Number;

use 5.014;

use strict;
use warnings;

use Data::Object ();

sub new {
  Data::Object->number(pop);
}

1;
