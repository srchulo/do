package Data::Object::Base::Regexp;

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

  if (!defined($data) || !re::is_regexp($data)) {
    croak('Instantiation Error: Not a RegexpRef');
  }

  return bless \$data, $class;
}

1;
