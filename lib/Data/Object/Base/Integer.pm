package Data::Object::Base::Integer;

use strict;
use warnings;

use Carp 'croak';
use Scalar::Util 'blessed', 'looks_like_number';

use parent 'Data::Object::Base';

# VERSION

# BUILD

sub new {
  my ($class, $data) = @_;

  my $role = 'Data::Object::Role::Detract';

  if (blessed($data) && $data->can('does') && $data->does($role)) {
    $data = $data->detract;
  }

  $data = "$data" if $data;

  if (defined $data) {
    $data =~ s/^\+//; # not keen on this but ...
  }

  if (!defined($data) || ref($data)) {
    croak('Instantiation Error: Not an Integer');
  }

  if (!looks_like_number($data)) {
    croak('Instantiation Error: Not an Integer');
  }

  $data += 0 unless $data =~ /[a-zA-Z]/;

  return bless \$data, $class;
}

1;
