package Data::Object::Scalar::Base;

use 5.014;

use strict;
use warnings;

use Scalar::Util ();

use parent 'Data::Object::Base';

# VERSION

# BUILD

sub new {
  my ($class, $data) = @_;

  if (Scalar::Util::blessed($data) && $data->can('detract')) {
    $data = $data->detract;
  }

  if (Scalar::Util::blessed($data) && $data->isa('Regexp') && $^V <= v5.12.0) {
    $data = do { \(my $q = qr/$data/) };
  }

  return bless ref($data) ? $data : \$data, $class;
}

1;
