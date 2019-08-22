package Data::Object::Autobox::Any;

use 5.014;

use strict;
use warnings;

use Data::Object ();

sub new {
  Data::Object->any(pop);
}

1;
