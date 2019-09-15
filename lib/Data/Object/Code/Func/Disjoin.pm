package Data::Object::Code::Func::Disjoin;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Code::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'CodeLike',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'CodeLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $code) = $self->unpack;

  return sub { $data->(@_) || $code->(@_) };
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
