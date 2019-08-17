package Data::Object::Type::Regexp;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoRegexp';
}

sub aliases {
  return ['RegexpObj', 'RegexpObject'];
}

sub coercions {
  return ['RegexpRef', sub {
      require Data::Object::Regexp;
      Data::Object::Regexp->new($_[0]);
  }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Regexp');

  return 1;
}

1;
