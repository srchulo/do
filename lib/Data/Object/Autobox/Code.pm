package Data::Object::Autobox::Code;

use 5.014;

use strict;
use warnings;

use Data::Object ();

# VERSION

# BUILD

sub new {
  Data::Object->code(pop);
}

1;
