# ABSTRACT: Exportable Universal Functions for Perl 5
package Data::Object::Export::Universal;

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
  return 1;
}

sub eq {
  my ($data) = @_;

  throw($data, "The eq() comparison operation is not supported");
}

sub gt {
  my ($data) = @_;

  throw($data, "The gt() comparison operation is not supported");
}

sub ge {
  my ($data) = @_;

  throw($data, "The ge() comparison operation is not supported");
}

sub lt {
  my ($data) = @_;

  throw($data, "The lt() comparison operation is not supported");
}

sub le {
  my ($data) = @_;

  throw($data, "The le() comparison operation is not supported");
}

sub ne {
  my ($data) = @_;

  throw($data, "The ne() comparison operation is not supported");
}

1;
