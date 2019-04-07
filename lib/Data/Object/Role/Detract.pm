package Data::Object::Role::Detract;

use strict;
use warnings;

use Data::Object::Role;

# VERSION

# BUILD
# METHODS

sub data {
  goto \&detract;
}

sub detract {
  my ($data) = @_;

  require Data::Object::Export;

  return Data::Object::Export::detract_deep($data);
}

1;
