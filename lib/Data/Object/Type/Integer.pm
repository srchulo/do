package Data::Object::Type::Integer;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoInt';
}

sub aliases {
  return ['IntObj', 'IntObject', 'IntegerObj', 'IntegerObject'];
}

sub coercions {
  my $coercions = [];

  push @$coercions, 'Str', sub {
    require Data::Object::Integer;
    Data::Object::Integer->new($_[0]);
  };
  push @$coercions, 'Num', sub {
    require Data::Object::Integer;
    Data::Object::Integer->new($_[0]);
  };
  push @$coercions, 'LaxNum', sub {
    require Data::Object::Integer;
    Data::Object::Integer->new($_[0]);
  };
  push @$coercions, 'StrictNum', sub {
    require Data::Object::Integer;
    Data::Object::Integer->new($_[0]);
  };
  push @$coercions, 'Int', sub {
    require Data::Object::Integer;
    Data::Object::Integer->new($_[0]);
  };

  return $coercions;
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Integer');

  return 1;
}

1;
