package Data::Object::Any::Autobox;

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
    require Data::Object::Any;

    if (!(Scalar::Util::blessed($data) && $data->isa('Data::Object::Any'))) {
      $data = Data::Object::Any->new($data);
    }

    return $data->$method(@args);
  };
}

1;
