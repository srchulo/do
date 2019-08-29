package Data::Object::Array;

use 5.014;

use strict;
use warnings;

use Role::Tiny::With;

use overload (
  '""'     => 'detract',
  '~~'     => 'detract',
  '@{}'    => 'self',
  fallback => 1
);

with qw(
  Data::Object::Role::Detract
  Data::Object::Role::Dumper
  Data::Object::Role::Functable
  Data::Object::Role::Output
  Data::Object::Role::Throwable
);

use parent 'Data::Object::Array::Base';

# VERSION

# METHODS

sub self {
  return shift;
}

sub list {
  my ($self) = @_;

  my @args = (map $self->deduce($_), @$self);

  return wantarray ? (@args) : $self->deduce([@args]);
}

1;
