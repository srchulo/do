package Data::Object::Type::Number;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

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

  push @$coercions, 'Str', sub { do('number', $_[0]) };
  push @$coercions, 'Num', sub { do('number', $_[0]) };
  push @$coercions, 'LaxNum', sub { do('number', $_[0]) };
  push @$coercions, 'StrictNum', sub { do('number', $_[0]) };

  return $coercions;
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Number');

  return 1;
}

1;
