package Data::Object::Float::Base;

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

  $data //= '0.0';

  if (Scalar::Util::blessed($data) && $data->can('detract')) {
    $data = $data->detract;
  }

  if (defined($data)) {
    $data =~ s/^\+//;
  }

  if (!defined($data) || ref($data)) {
    Carp::confess('Instantiation Error: Not a Float');
  }

  if (!Scalar::Util::looks_like_number($data)) {
    Carp::confess('Instantiation Error: Not a Float');
  }

  return bless \$data, $class;
}

1;
