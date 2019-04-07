package Data::Object::Type::Float;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

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

  push @$coercions, 'Str', sub { do('float', $_[0]) };
  push @$coercions, 'Num', sub { do('float', $_[0]) };
  push @$coercions, 'LaxNum', sub { do('float', $_[0]) };

  return $coercions;
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Float');

  return 1;
}

1;
