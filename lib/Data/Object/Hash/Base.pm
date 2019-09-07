package Data::Object::Hash::Base;

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

  $data //= {};

  if (Scalar::Util::blessed($data) && $data->can('detract')) {
    $data = $data->detract;
  }

  unless (ref($data) eq 'HASH') {
    Carp::confess('Instantiation Error: Not a HashRef');
  }

  return bless $data, $class;
}

1;
