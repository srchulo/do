package Data::Object::Type::Number;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoNum';
}

sub aliases {
  return ['NumObj', 'NumObject', 'NumberObj', 'NumberObject'];
}

sub coercions {
  my $coercions = [];

  push @$coercions, 'Str', sub {
    require Data::Object::Number;
    Data::Object::Number->new($_[0]);
  };
  push @$coercions, 'Num', sub {
    require Data::Object::Number;
    Data::Object::Number->new($_[0]);
  };
  push @$coercions, 'LaxNum', sub {
    require Data::Object::Number;
    Data::Object::Number->new($_[0]);
  };
  push @$coercions, 'StrictNum', sub {
    require Data::Object::Number;
    Data::Object::Number->new($_[0]);
  };

  return $coercions;
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Number');

  return 1;
}

1;
