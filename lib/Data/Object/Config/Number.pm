# ABSTRACT: Exportable Number Functions for Perl 5
package Data::Object::Config::Number;

use 5.014;

use strict;
use warnings;

use Data::Object 'codify', 'throw';

use parent 'Exporter::Tiny';

# VERSION

our @EXPORT_OK = (
  'abs',
  'atan2',
  'cos',
  'decr',
  'defined',
  'exp',
  'hex',
  'incr',
  'int',
  'log',
  'mod',
  'neg',
  'pow',
  'sin',
  'sqrt'
);

sub abs {
  my ($data) = @_;

  return CORE::abs($data);
}

sub atan2 {
  my ($data, $arg) = @_;

  return CORE::atan2($data, $arg);
}

sub cos {
  my ($data) = @_;

  return CORE::cos($data);
}

sub decr {
  my ($data, $arg) = @_;

  return $data - ($arg || 1);
}

sub defined {
  return 1;
}

sub exp {
  my ($data) = @_;

  return CORE::exp($data);
}

sub hex {
  my ($data) = @_;

  return sprintf '%#x', $data;
}

sub incr {
  my ($data, $arg) = @_;

  return $data + ($arg || 1);
}

sub int {
  my ($data) = @_;

  return CORE::int($data);
}

sub log {
  my ($data) = @_;

  return CORE::log($data);
}

sub mod {
  my ($data, $arg) = @_;

  return $data % $arg;
}

sub neg {
  my ($data) = @_;

  return -$data;
}

sub pow {
  my ($data, $arg) = @_;

  return $data**$arg;
}

sub sin {
  my ($data) = @_;

  return CORE::sin($data);
}

sub sqrt {
  my ($data) = @_;

  return CORE::sqrt($data);
}

1;
