# ABSTRACT: Exportable Code Functions for Perl 5
package Data::Object::Export::Code;

use 5.014;

use strict;
use warnings;

use Data::Object 'codify', 'throw';

use parent 'Exporter::Tiny';

# VERSION

our @EXPORT_OK = (
  'call',
  'compose',
  'conjoin',
  'curry',
  'defined',
  'disjoin',
  'next',
  'rcurry'
);

sub call {
  my ($data, @args) = @_;

  return $data->(@args);
}

sub compose {
  my ($data, $code, @args) = @_;

  my $refs = {'$code' => \$code};

  $code = codify($code, $refs);

  return curry(sub { $code->($data->(@_)) }, @args);
}

sub conjoin {
  my ($data, $code) = @_;

  my $refs = {'$code' => \$code};

  $code = codify($code, $refs);

  return sub { $data->(@_) && $code->(@_) };
}

sub curry {
  my ($data, @args) = @_;

  return sub { $data->(@args, @_) };
}

sub defined {
  return 1;
}

sub disjoin {
  my ($data, $code) = @_;

  my $refs = {'$code' => \$code};

  $code = codify($code);

  return sub { $data->(@_) || $code->(@_) };
}

sub next {
  my ($data, @args) = @_;

  return $data->call(@args);
}

sub rcurry {
  my ($data, @args) = @_;

  return sub { $data->(@_, @args) };
}

1;
