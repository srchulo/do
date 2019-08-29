package Data::Object::Undef::Base;

use 5.014;

use strict;
use warnings;

use Carp ();
use Scalar::Util ();

use parent 'Data::Object::Base';

# VERSION

# BUILD

sub new {
  my ($class, $data) = @_;

  if (Scalar::Util::blessed($data) && $data->can('detract')) {
    $data = $data->detract;
  }

  if (defined $data) {
    Carp::confess('Instantiation Error: Not an Undef');
  }

  return bless \$data, $class;
}

1;
