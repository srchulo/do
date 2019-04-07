package Data::Object::Type::Integer;

use strict;
use warnings;

use Data::Object::Export;

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

  push @$coercions, 'Str', sub { do('integer', $_[0]) };
  push @$coercions, 'Num', sub { do('integer', $_[0]) };
  push @$coercions, 'LaxNum', sub { do('integer', $_[0]) };
  push @$coercions, 'StrictNum', sub { do('integer', $_[0]) };
  push @$coercions, 'Int', sub { do('integer', $_[0]) };

  return $coercions;
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Integer');

  return 1;
}

1;
