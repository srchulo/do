# ABSTRACT: Exportable Undef Functions for Perl 5
package Data::Object::Config::Undef;

use 5.014;

use strict;
use warnings;

use Data::Object 'codify', 'throw';

use parent 'Exporter::Tiny';

# VERSION

our @EXPORT_OK = (
  'defined',
  'eq',
  'gt',
  'ge',
  'lt',
  'le',
  'ne'
);

sub defined {
  return 0;
}

sub eq {
  my ($data, $arg1) = @_;

  return CORE::defined($arg1) ? 0 : 1;
}

sub gt {
  my ($data, $arg1) = @_;

  return 0;
}

sub ge {
  my ($data, $arg1) = @_;

  return &eq($data, $arg1) ? 1 : 0;
}

sub lt {
  my ($data, $arg1) = @_;

  return 0;
}

sub le {
  my ($data, $arg1) = @_;

  return &eq($data, $arg1) ? 1 : 0;
}

sub ne {
  my ($data, $arg1) = @_;

  return CORE::defined($arg1) ? 1 : 0;
}

1;
