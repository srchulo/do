package Data::Object::Type::Dispatch;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoDispatch';
}

sub aliases {
  return ['DispatchObj', 'DispatchObject'];
}

sub coercions {
  my $coercions = [];

  push @$coercions, 'Str', sub { do('dispatch', $_[0]) };
  push @$coercions, 'ArrayRef', sub { do('dispatch', @{$_[0]}) };

  return $coercions;
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Dispatch');

  return 1;
}

1;
