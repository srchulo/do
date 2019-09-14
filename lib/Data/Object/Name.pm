package Data::Object::Name;

use 5.014;

use strict;
use warnings;

# VERSION

# METHODS

my $sep = qr/'|__|::/;

sub new {
  my ($class, @args) = @_;

  my $name = join(' ', @args) || $class;

  return bless \$name, $class;
}

sub file {
  my ($self) = @_;

  return $$self if $self->lookslike_a_file;

  my $string = $self->package;

  return join '__', map {
    join '_', map {lc} map {split /_/} grep {length}
    split /([A-Z]{1}[^A-Z]*)/
  } split /$sep/, $string;
}

sub label {
  my ($self) = @_;

  return $$self if $self->lookslike_a_label;

  return join '_', split /$sep/, $self->package;
}

sub package {
  my ($self) = @_;

  return $$self if $self->lookslike_a_package;

  my $string = $$self;

  if ($string !~ $sep) {
    return join '', map {ucfirst} split /[^a-zA-Z0-9]/, $string;
  } else {
    return join '::', map {
      join '', map {ucfirst} split /[^a-zA-Z0-9]/
    } split /$sep/, $string;
  }
}

sub path {
  my ($self) = @_;

  return $$self if $self->lookslike_a_path;

  return join '/', split /$sep/, $self->package;
}

sub format {
  my ($self, $method, $format) = @_;

  my $string = $self->$method;

  return sprintf($format || '%s', $string);
}

sub lookslike_a_file {
  my ($self) = @_;

  my $string = $$self;

  return $string =~ /^[a-z](?:\w*[a-z])?$/;
}

sub lookslike_a_label {
  my ($self) = @_;

  my $string = $$self;

  return $string =~ /^[A-Z](?:\w*[a-zA-Z0-9])?$/;
}

sub lookslike_a_package {
  my ($self) = @_;

  my $string = $$self;

  return $string =~ /^[A-Z](?:(?:\w|::)*[a-zA-Z0-9])?$/;
}

sub lookslike_a_path {
  my ($self) = @_;

  my $string = $$self;

  return $string =~ /^[A-Z](?:(?:\w|\\|\/|[\:\.]{1}[a-zA-Z0-9])*[a-zA-Z0-9])?$/;
}

1;
