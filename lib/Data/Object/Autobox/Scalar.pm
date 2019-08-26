package Data::Object::Autobox::Scalar;

use 5.014;

use strict;
use warnings;

use Data::Object ();

# VERSION

# BUILD

sub new {
  Data::Object->scalar(pop);
}

1;
