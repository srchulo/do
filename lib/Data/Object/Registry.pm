package Data::Object::Registry;

use strict;
use warnings;

use Data::Object::State;
use Type::Registry;

use parent 'Data::Object::Kind';

# BUILD
# METHODS

sub def {
  'Data::Object::Config::Library';
}

sub get {
  my ($self, $key) = @_;

  return undef if !$key;

  return $self->tns->{$key};
}

sub lut {
  my ($self, $key) = @_;

  return [] if !$key;

  my $tbl = $self->get($key);

  return [] if !$tbl;

  return [sort { $tbl->{$a} <=> $tbl->{$b} } keys %$tbl];
}

sub obj {
  my ($self, $key) = @_;

  my $lut = $self->lut($key);

  unshift @$lut, $self->def;

  my $obj = "Type::Registry"->for_class($key);

  $obj->add_types($_) for @$lut;

  return $obj;
}

sub rem {
  my ($self, $key, $val) = @_;

  return undef if !$key || !$val;
  return undef if !$self->get($key);

  my $tns = $self->tns;

  return delete $tns->{$key}{$val};
}

sub set {
  my ($self, $key, $val) = @_;

  my $tns = $self->tns;
  my $tbl = $self->get($key) || {};

  $tns->{$key}{$val} = (keys(%$tbl) || 0) + 1 if !$tns->{$key}{$val};

  return $tns->{$key}{$val};
}

sub tns {
  my ($self) = @_;

  $self->{spaces} ||= {} if !$self->{spaces};

  return $self->{spaces};
}

1;
