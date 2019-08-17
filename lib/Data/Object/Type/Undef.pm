package Data::Object::Type::Undef;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoUndef';
}

sub aliases {
  return ['UndefObj', 'UndefObject'];
}

sub coercions {
  return ['Undef', sub {
      require Data::Object::Undef;
      Data::Object::Undef->new($_[0]);
  }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Undef');

  return 1;
}

1;
