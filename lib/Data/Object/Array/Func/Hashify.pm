package Data::Object::Array::Func::Hashify;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Array::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'ArrayLike',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Undef | UndefObject | CodeLike',
  opt => 1
);

has args => (
  is => 'ro',
  isa => 'ArrayRef[Any]',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $code, @args) = $self->unpack;

  my $hash = {};

  for (my $i = 0; $i < @$data; $i++) {
    my $value = $data->[$i];

    if (defined($value)) {
      my $result = $code->($value, @args) if $code;

      $hash->{$value} = defined($result) ? $result : 1;
    }
  }

  return $hash;
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;
