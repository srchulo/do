package Data::Object::Hash::Autobox;

use 5.014;

use strict;
use warnings;

use Role::Tiny::With;

with 'Data::Object::Role::Proxyable';

# VERSION

# BUILD

sub BUILDPROXY {
  my ($class, $method, $data, @args) = @_;

  return sub {
    require Data::Object::Hash;

    if (!(Scalar::Util::blessed($data) && $data->isa('Data::Object::Hash'))) {
      $data = Data::Object::Hash->new($data);
    }

    return $data->$method(@args);
  };
}

1;
