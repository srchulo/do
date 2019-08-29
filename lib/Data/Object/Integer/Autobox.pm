package Data::Object::Integer::Autobox;

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
    require Data::Object::Integer;

    if (!(Scalar::Util::blessed($data) && $data->isa('Data::Object::Integer'))) {
      $data = Data::Object::Integer->new($data);
    }

    return $data->$method(@args);
  };
}

1;
