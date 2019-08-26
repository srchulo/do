package Data::Object::Autobox::Integer;

use 5.014;

use strict;
use warnings;

use Data::Object ();

# VERSION

# BUILD

sub new {
  Data::Object->integer(pop);
}

1;
