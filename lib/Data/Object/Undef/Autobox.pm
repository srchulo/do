package Data::Object::Undef::Autobox;

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
    require Data::Object::Undef;

    if (!(Scalar::Util::blessed($data) && $data->isa('Data::Object::Undef'))) {
      $data = Data::Object::Undef->new($data);
    }

    return $data->$method(@args);
  };
}

1;
