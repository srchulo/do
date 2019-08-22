package Data::Object::Autobox::Undef;

use 5.014;

use strict;
use warnings;

use Data::Object ();

sub new {
  Data::Object->undef(pop);
}

1;
