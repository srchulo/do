package Data::Object::Autobox::String;

use 5.014;

use strict;
use warnings;

use Data::Object ();

# VERSION

# BUILD

sub new {
  Data::Object->string(pop);
}

1;
