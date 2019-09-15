package Data::Object::String::Func::Lowercase;

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

  return $self->arg1->lc;
}

sub mapping {
  return ('arg1');
}

1;
