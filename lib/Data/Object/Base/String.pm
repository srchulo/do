package Data::Object::Base::String;

use strict;
use warnings;

use Carp 'croak';
use Scalar::Util 'blessed';

use parent 'Data::Object::Base';

# VERSION

# BUILD

sub new {
  my ($class, $data) = @_;

  my $role = 'Data::Object::Role::Detract';

  if (blessed($data) && $data->can('does') && $data->does($role)) {
    $data = $data->detract;
  }

  $data = $data ? "$data" : "";

  if (!defined($data) || ref($data)) {
    croak('Instantiation Error: Not a String');
  }

  return bless \$data, $class;
}

1;
