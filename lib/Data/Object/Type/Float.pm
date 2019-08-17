package Data::Object::Type::Float;

use strict;
use warnings;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoFloat';
}

sub aliases {
  return ['FloatObj', 'FloatObject'];
}

sub coercions {
  my $coercions = [];

  push @$coercions, 'Str', sub {
    require Data::Object::Float;
    Data::Oject::Float->new($_[0]);
  };
  push @$coercions, 'Num', sub {
    require Data::Object::Float;
    Data::Oject::Float->new($_[0]);
  };
  push @$coercions, 'LaxNum', sub {
    require Data::Object::Float;
    Data::Oject::Float->new($_[0]);
  };

  return $coercions;
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Float');

  return 1;
}

1;
