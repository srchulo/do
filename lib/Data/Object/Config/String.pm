# ABSTRACT: Exportable String Functions for Perl 5
package Data::Object::Config::String;

use 5.014;

use strict;
use warnings;

use Data::Object 'codify', 'throw';

use parent 'Exporter::Tiny';

# VERSION

our @EXPORT_OK = (
  'append',
  'camelcase',
  'chomp',
  'chop',
  'concat',
  'contains',
  'defined',
  'hex',
  'index',
  'lc',
  'lcfirst',
  'length',
  'lines',
  'lowercase',
  'replace',
  'reverse',
  'rindex',
  'snakecase',
  'split',
  'strip',
  'titlecase',
  'trim',
  'uc',
  'ucfirst',
  'uppercase',
  'words'
);

sub append {
  my ($data, @args) = @_;

  return CORE::join(' ', "$data", @args);
}

sub camelcase {
  my ($data) = @_;

  my $result = CORE::ucfirst(CORE::lc("$data"));

  $result =~ s/[^a-zA-Z0-9]+([a-z])/\U$1/g;
  $result =~ s/[^a-zA-Z0-9]+//g;

  return $result;
}

sub chomp {
  my ($data) = @_;

  my $result = "$data";

  CORE::chomp($result);

  return $result;
}

sub chop {
  my ($data) = @_;

  my $result = "$data";

  CORE::chop($result);

  return $result;
}

sub concat {
  my ($data, @args) = @_;

  return CORE::join('', "$data", @args);
}

sub contains {
  my ($data, $pattern) = @_;

  return 0 unless CORE::defined($pattern);

  my $regexp = UNIVERSAL::isa($pattern, 'Regexp');

  return CORE::index("$data", $pattern) < 0 ? 0 : 1 if !$regexp;

  return ("$data" =~ $pattern) ? 1 : 0;
}

sub defined {
  my ($data) = @_;

  return 1;
}

sub hex {
  my ($data) = @_;

  return CORE::hex("$data");
}

sub index {
  my ($data, $substr, $start) = @_;

  return CORE::index("$data", $substr) if not CORE::defined $start;
  return CORE::index("$data", $substr, $start);
}

sub lc {
  my ($data) = @_;

  return CORE::lc("$data");
}

sub lcfirst {
  my ($data) = @_;

  return CORE::lcfirst("$data");
}

sub length {
  my ($data) = @_;

  return CORE::length("$data");
}

sub lines {
  my ($data) = @_;

  return [CORE::split(/[\n\r]+/, "$data")];
}

sub lowercase {
  goto \&lc;
}

sub replace {
  my ($data, $search, $replace, $flags) = @_;

  my $result = "$data";
  my $regexp = UNIVERSAL::isa($search, 'Regexp');

  $flags = CORE::defined($flags) ? $flags : '';
  $search = CORE::quotemeta($search) if $search and !$regexp;

  local $@;
  eval("sub { \$_[0] =~ s/$search/$replace/$flags }")->($result);

  return $result;
}

sub reverse {
  my ($data) = @_;

  return CORE::scalar CORE::reverse "$data";
}

sub rindex {
  my ($data, $substr, $start) = @_;

  return CORE::rindex("$data", $substr) if not CORE::defined $start;
  return CORE::rindex("$data", $substr, $start);
}

sub snakecase {
  my ($data) = @_;

  my $result = CORE::lc("$data");

  $result =~ s/[^a-zA-Z0-9]+([a-z])/\U$1/g;
  $result =~ s/[^a-zA-Z0-9]+//g;

  return $result;
}

sub split {
  my ($data, $pattern, $limit) = @_;

  my $regexp = UNIVERSAL::isa($pattern, 'Regexp');

  $pattern = CORE::quotemeta($pattern) if $pattern and !$regexp;

  return [CORE::split(/$pattern/, "$data")] if !CORE::defined($limit);
  return [CORE::split(/$pattern/, "$data", $limit)];
}

sub strip {
  my ($data) = @_;

  my $result = "$data";

  $result =~ s/\s{2,}/ /g;

  return $result;
}

sub titlecase {
  my ($data) = @_;

  my $result = "$data";

  $result =~ s/\b(\w)/\U$1/g;

  return $result;
}

sub trim {
  my ($data) = @_;

  my $result = "$data";

  $result =~ s/^\s+|\s+$//g;

  return $result;
}

sub uc {
  my ($data) = @_;

  return CORE::uc("$data");
}

sub ucfirst {
  my ($data) = @_;

  return CORE::ucfirst("$data");
}

sub uppercase {
  goto \&uc;
}

sub words {
  my ($data) = @_;

  return [CORE::split(/\s+/, "$data")];
}

1;
