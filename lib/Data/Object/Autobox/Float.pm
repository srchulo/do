package Data::Object::Autobox::Float;

use 5.014;

use strict;
use warnings;

use Data::Object ();

sub new {
  Data::Object->float(pop);
}

1;
