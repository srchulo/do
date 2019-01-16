# ABSTRACT: Exportable Array Functions for Perl 5
package Data::Object::Config::Array;

use 5.014;

use strict;
use warnings;

use Data::Object 'codify', 'throw';

use parent 'Exporter::Tiny';

# VERSION

our @EXPORT_OK = (
  'all',
  'any',
  'clear',
  'count',
  'defined',
  'delete',
  'each',
  'each_key',
  'each_n_values',
  'each_value',
  'empty',
  'eq',
  'exists',
  'first',
  'ge',
  'get',
  'grep',
  'gt',
  'hash',
  'hashify',
  'head',
  'invert',
  'iterator',
  'join',
  'keyed',
  'keys',
  'last',
  'le',
  'length',
  'list',
  'lt',
  'map',
  'max',
  'min',
  'ne',
  'none',
  'nsort',
  'one',
  'pairs',
  'pairs_array',
  'pairs_hash',
  'part',
  'pop',
  'push',
  'random',
  'reverse',
  'rnsort',
  'rotate',
  'rsort',
  'set',
  'shift',
  'size',
  'slice',
  'sort',
  'sum',
  'tail',
  'unique',
  'unshift',
  'values'
);

our %EXPORT_TAGS = (
  all => [@EXPORT_OK]
);

sub all {
  my ($data, $code, @args) = @_;

  my $found = 0;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value,};
    $found++ if codify($code, $refs)->($value, @args);
  }

  return $found == @$data ? 1 : 0;
}

sub any {
  my ($data, $code, @args) = @_;

  my $found = 0;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};
    $found++ if codify($code, $refs)->($value, @args);
  }

  return $found ? 1 : 0;
}

sub clear {
  goto \&empty;
}

sub count {
  goto \&length;
}

sub defined {
  my ($data, $index) = @_;

  return CORE::defined($data->[$index]);
}

sub delete {
  my ($data, $index) = @_;

  return CORE::delete($data->[$index]);
}

sub each {
  my ($data, $code, @args) = @_;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};
    codify($code, $refs)->($index, $value, @args);
  }

  return $data;
}

sub each_key {
  my ($data, $code, @args) = @_;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};
    codify($code, $refs)->($index, @args);
  }

  return $data;
}

sub each_n_values {
  my ($data, $number, $code, @args) = @_;

  my $refs = {};
  my @list = (0 .. $#{$data});

  while (my @indexes = CORE::splice(@list, 0, $number)) {
    my @values;

    for (my $i = 0; $i < $number; $i++) {
      my $pos   = $i;
      my $index = $indexes[$pos];
      my $value = CORE::defined($index) ? $data->[$index] : undef;

      $refs->{"\$index${i}"} = $index if CORE::defined $index;
      $refs->{"\$value${i}"} = $value if CORE::defined $value;

      push @values, $value;
    }

    codify($code, $refs)->(@values, @args);
  }

  return $data;
}

sub each_value {
  my ($data, $code, @args) = @_;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value,};

    codify($code, $refs)->($value, @args);
  }

  return $data;
}

sub empty {
  my ($data) = @_;

  $#$data = -1;

  return $data;
}

sub eq {
  my ($data) = @_;

  throw($data, "The eq() comparison operation is not supported");
}

sub exists {
  my ($data, $index) = @_;

  return $index <= $#{$data};
}

sub first {
  my ($data) = @_;

  return $data->[0];
}

sub ge {
  my ($data) = @_;

  throw($data, "The ge() comparison operation is not supported");
}

sub get {
  my ($data, $index) = @_;

  return $data->[$index];
}

sub grep {
  my ($data, $code, @args) = @_;

  my @caught;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};
    push @caught, $value if codify($code, $refs)->($value, @args);
  }

  return [@caught];
}

sub gt {
  my ($data) = @_;

  throw($data, "The gt() comparison operation is not supported");
}

sub hash {
  goto \&pairs_hash;
}

sub hashify {
  my ($data, $code, @args) = @_;

  my $hash = {};

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};

    if (CORE::defined($value)) {
      my $result = codify($code, $refs)->($value, @args);
      $hash->{$value} = $result if CORE::defined($result);
    }
  }

  return $hash;
}

sub head {
  my ($data) = @_;

  return $data->[0];
}

sub invert {
  goto \&reverse;
}

sub iterator {
  my ($data) = @_;

  my $i = 0;

  return sub {
    return undef if $i > $#{$data};
    return $data->[$i++];
  }
}

sub join {
  my ($data, $delimiter) = @_;

  return CORE::join $delimiter // '', @$data;
}

sub keyed {
  my ($data, @keys) = @_;

  my $i = 0;
  return {CORE::map { $_ => $data->[$i++] } @keys};
}

sub keys {
  my ($data) = @_;

  return [0 .. $#{$data}];
}

sub last {
  my ($data) = @_;

  return $data->[-1];
}

sub le {
  my ($data) = @_;

  throw($data, "The le() comparison operation is not supported");
}

sub length {
  my ($data) = @_;

  return scalar(@$data);
}

sub list {
  my ($data) = @_;

  return [@$data];
}

sub lt {
  my ($data) = @_;

  throw($data, "The lt() comparison operation is not supported");
}

sub map {
  my ($data, $code, @args) = @_;

  my @caught;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};
    push @caught, codify($code, $refs)->($value, @args);
  }

  return [@caught];
}

sub max {
  my ($data) = @_;

  my $max;

  for my $val (@$data) {
    next if ref($val);
    next if !CORE::defined($val);
    next if !Scalar::Util::looks_like_number($val);

    $max //= $val;
    $max = $val if $val > $max;
  }

  return $max;
}

sub min {
  my ($data) = @_;

  my $min;

  for my $val (@$data) {
    next if ref($val);
    next if !CORE::defined($val);
    next if !Scalar::Util::looks_like_number($val);

    $min //= $val;
    $min = $val if $val < $min;
  }

  return $min;
}

sub ne {
  my ($data) = @_;

  throw($data, "The ne() comparison operation is not supported");
}

sub none {
  my ($data, $code, @args) = @_;

  my $found = 0;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};
    $found++ if codify($code, $refs)->($value, @args);
  }

  return $found ? 0 : 1;
}

sub nsort {
  my ($data) = @_;

  return [CORE::sort { $a <=> $b } @$data];
}

sub one {
  my ($data, $code, @args) = @_;

  my $found = 0;

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};
    $found++ if codify($code, $refs)->($value, @args);
  }

  return $found == 1 ? 1 : 0;
}

sub pairs {
  goto \&pairs_array;
}

sub pairs_array {
  my ($data) = @_;

  my $i = 0;
  return [CORE::map +[$i++, $_], @$data];
}

sub pairs_hash {
  my ($data) = @_;

  my $i = 0;
  return {CORE::map { $i++ => $_ } @$data};
}

sub part {
  my ($data, $code, @args) = @_;

  my $retv = [[], []];

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};
    my $result = codify($code, $refs)->($value, @args);
    my $slot = $result ? $$retv[0] : $$retv[1];
    CORE::push @$slot, $value;
  }

  return $retv;
}

sub pop {
  my ($data) = @_;

  return CORE::pop @$data;
}

sub push {
  my ($data, @args) = @_;

  CORE::push @$data, @args;

  return $data;
}

sub random {
  my ($data) = @_;

  return @$data[CORE::rand($#{$data} + 1)];
}

sub reverse {
  my ($data) = @_;

  return [CORE::reverse(@$data)];
}

sub rotate {
  my ($data) = @_;

  CORE::push(@$data, CORE::shift(@$data));

  return $data;
}

sub rnsort {
  my ($data) = @_;

  return [CORE::sort { $b <=> $a } @$data];
}

sub rsort {
  my ($data) = @_;

  return [CORE::sort { $b cmp $a } @$data];
}

sub set {
  my ($data, $index, $value) = @_;

  return $data->[$index] = $value;
}

sub shift {
  my ($data) = @_;

  return CORE::shift(@$data);
}

sub size {
  goto \&length;
}

sub slice {
  my ($data, @args) = @_;

  return [@$data[@args]];
}

sub sort {
  my ($data) = @_;

  return [CORE::sort { $a cmp $b } @$data];
}

sub sum {
  my ($data) = @_;

  my $sum = 0;

  for my $val (@$data) {
    next if !CORE::defined($val)
      || (Scalar::Util::blessed($val)
      and not $val->does('Data::Object::Role::Numeric'))
      || !Scalar::Util::looks_like_number($val);
    $val += 0;
    $sum += $val;
  }

  return $sum;
}

sub tail {
  my ($data) = @_;

  return [@$data[1 .. $#$data]];
}

sub unique {
  my ($data) = @_;

  my %seen;
  return [CORE::grep { not $seen{$_}++ } @$data];
}

sub unshift {
  my ($data, @args) = @_;

  CORE::unshift(@$data, @args);

  return $data;
}

sub values {
  my ($data, @args) = @_;

  return [@args ? @$data[@args] : @$data];
}

1;
