package Data::Object::Base;

use 5.014;

use strict;
use warnings;

# VERSION

# METHODS

sub class {
  my ($self) = @_;

  my $class = ref $self || $self;

  return $class;
}

sub deduce {
  # 1-arg: called by user
  # 2-arg: called by user
  # 3-arg: called by overload
  my $data;

  $data = $#_ < 2 ? pop : shift;

  require Data::Object::Utility;

  return Data::Object::Utility::DeduceDeep($data);
}

sub detract {
  # 1-arg: called by user
  # 2-arg: called by user
  # 3-arg: called by overload
  my $data;

  $data = $#_ < 2 ? pop : shift;

  require Data::Object::Utility;

  return Data::Object::Utility::DetractDeep($data);
}

sub space {
  my ($data) = (pop);

  my $class = ref $data || $data;

  require Data::Object::Space;

  return Data::Object::Space->new($class);
}

sub type {
  my ($data) = (pop);

  require Data::Object::Utility;

  return Data::Object::Utility::TypeName($data);
}

1;
