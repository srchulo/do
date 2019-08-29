package Data::Object::String::Autobox;

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
    require Data::Object::String;

    if (!(Scalar::Util::blessed($data) && $data->isa('Data::Object::String'))) {
      $data = Data::Object::String->new($data);
    }

    return $data->$method(@args);
  };
}

1;
