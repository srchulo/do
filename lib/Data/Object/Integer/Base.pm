package Data::Object::Integer::Base;

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

  $data = "$data" if $data;

  if (defined $data) {
    $data =~ s/^\+//; # not keen on this but ...
  }

  if (!defined($data) || ref($data)) {
    Carp::confess('Instantiation Error: Not an Integer');
  }

  if (!Scalar::Util::looks_like_number($data)) {
    Carp::confess('Instantiation Error: Not an Integer');
  }

  $data += 0 unless $data =~ /[a-zA-Z]/;

  return bless \$data, $class;
}

1;
