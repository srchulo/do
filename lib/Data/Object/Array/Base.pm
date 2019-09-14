package Data::Object::Array::Base;

use 5.014;

use strict;
use warnings;

use Carp ();

use parent 'Data::Object::Base';

# VERSION

# BUILD

sub new {
  my ($class, $data) = @_;

  $data //= [];

  $DB::single=1;
  if (Scalar::Util::blessed($data) && $data->can('detract')) {
    $data = $data->detract;
  }

  unless (ref($data) eq 'ARRAY') {
    Carp::confess('Instantiation Error: Not a ArrayRef');
  }

  return bless $data, $class;
}

1;
