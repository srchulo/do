package Data::Object::Autobox::Array;

use 5.014;

use strict;
use warnings;

use Data::Object ();

sub new {
  Data::Object->array(pop);
}

1;
