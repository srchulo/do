package Data::Object::String::Func::Trim;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::String::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'StringLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  my $result = "$data";

  $result =~ s/^\s+|\s+$//g;

  return $result;
}

sub mapping {
  return ('arg1');
}

1;
