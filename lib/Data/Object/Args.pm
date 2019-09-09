package Data::Object::Args;

use 5.014;

use strict;
use warnings;

use Moo;

with 'Data::Object::Role::Proxyable';
with 'Data::Object::Role::Stashable';

# VERSION

has named => (
  is => 'ro'
);

# BUILD

sub BUILD {
  my ($self, $args) = @_;

  $self->{named} = {} if !$args->{named};

  my $argv = { map +($_, $ARGV[$_]), 0..$#ARGV };

  $self->stash(argv => $argv);

  return $self;
}

sub BUILDPROXY {
  my ($class, $method, $self, $value) = @_;

  return if !$self;

  my $has_value = exists $_[3];

  return sub {
    return $self->get($method) if !$has_value; # no val

    return $self->set($method, $value);
  };
}

# METHODS

sub get {
  my ($self, $key) = @_;

  return if not defined $key;

  my $pos = $self->name($key);

  return if not defined $pos;

  return $self->stashed->{$pos};
}

sub set {
  my ($self, $key, $val) = @_;

  return if not defined $key;

  my $pos = $self->name($key);

  return if not defined $pos;

  return $self->stashed->{$pos} = $val;
}

sub exists {
  my ($self, $key) = @_;

  return if not defined $key;

  my $pos = $self->name($key);

  return if not defined $pos;

  return exists $self->stashed->{$pos};
}

sub name {
  my ($self, $key) = @_;

  if (defined $self->named->{$key}) {
    return $self->named->{$key};
  }

  if (defined $self->stashed->{$key}) {
    return $key;
  }

  return undef;
}

sub stashed {
  my ($self) = @_;

  my $data = $self->stash('argv');

  return $data;
}

1;
