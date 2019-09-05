package Data::Object::Hash::Func::FilterInclude;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Hash::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has args => (
  is => 'ro',
  isa => 'ArrayRef[Str]',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, @args) = $self->unpack;

  return {
    map { exists($data->{$_}) ? ($_ => $data->{$_}) : () }
      @args
  };
}

sub mapping {
  return ('arg1', '@args');
}

1;
