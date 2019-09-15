package Data::Object::Hash::Func::Lookup;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Hash::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'HashLike',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'StringLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $path) = $self->unpack;

  return undef
    unless ($data and $path)
    and (('HASH' eq ref($data))
    or Scalar::Util::blessed($data) and $data->isa('HASH'));

  return $data->{$path} if $data->{$path};

  my $next;
  my $rest;

  ($next, $rest) = $path =~ /(.*)\.([^\.]+)$/;

  if ($next and $data->{$next}) {
    return $self->new($data->{$next}, $rest)->execute;
  }

  ($next, $rest) = $path =~ /([^\.]+)\.(.*)$/;

  if ($next and $data->{$next}) {
    return $self->new($data->{$next}, $rest)->execute;
  }

  return undef;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
