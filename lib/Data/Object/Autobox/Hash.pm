package Data::Object::Autobox::Hash;

use 5.014;

use strict;
use warnings;

use Data::Object ();

sub new {
  Data::Object->hash(pop);
}

1;
