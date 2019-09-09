package Data::Object::Hash::Func::Grep;

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

has arg2 => (
  is => 'ro',
  isa => 'CodeRef',
  req => 1
);

has args => (
  is => 'ro',
  isa => 'ArrayRef[Any]',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my $results = [];

  my ($data, $code, @args) = $self->unpack;

  for my $key (keys %$data) {
    my $value = $data->{$key};
    my $result = $code->($value, @args);

    push @$results, $key, $value if $result;
  }

  return {@$results};
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;