package Data::Object::String::Base;

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

  $data //= '';

  if (Scalar::Util::blessed($data) && $data->can('detract')) {
    $data = $data->detract;
  }

  $data = $data ? "$data" : "";

  if (!defined($data) || ref($data)) {
    Carp::confess('Instantiation Error: Not a String');
  }

  return bless \$data, $class;
}

1;
