# ABSTRACT: Exportable Hash Functions for Perl 5
package Data::Object::Export::Hash;

use 5.014;

use strict;
use warnings;

use Data::Object 'codify', 'throw';

use parent 'Exporter::Tiny';

# VERSION

our @EXPORT_OK = (
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
  'filter_exclude',
  'filter_include',
  'fold',
  'ge',
  'get',
  'grep',
  'gt',
  'head',
  'invert',
  'iterator',
  'join',
  'keys',
  'le',
  'length',
  'list',
  'lookup',
  'lt',
  'map',
  'merge',
  'ne',
  'pairs',
  'reset',
  'reverse',
  'set',
  'slice',
  'sort',
  'tail',
  'unfold',
  'values'
);

sub clear {
  goto \&empty;
}

sub count {
  goto \&length;
}

sub defined {
  my ($data, $key) = @_;

  return CORE::defined($data->{$key});
}

sub delete {
  my ($data, $key) = @_;

  return CORE::delete($data->{$key});
}

sub each {
  my ($data, $code, @args) = @_;

  for my $key (CORE::keys %$data) {
    my $value = $data->{$key};
    my $refs = {'$key' => \$key, '$value' => \$value};
    codify($code, $refs)->($key, $value, @args);
  }

  return $data;
}

sub each_key {
  my ($data, $code, @args) = @_;

  for my $key (CORE::keys %$data) {
    my $value = $data->{$key};
    my $refs = {'$key' => \$key, '$value' => \$value,};
    codify($code, $refs)->($key, @args);
  }

  return $data;
}

sub each_n_values {
  my ($data, $number, $code, @args) = @_;

  my $refs = {};
  my @list = CORE::keys %$data;

  while (my @keys = CORE::splice(@list, 0, $number)) {
    my @values;

    for (my $i = 0; $i < @keys; $i++) {
      my $pos   = $i;
      my $key   = $keys[$pos];
      my $value = CORE::defined($key) ? $data->{$key} : undef;

      $refs->{"\$key${i}"}   = $key   if CORE::defined $key;
      $refs->{"\$value${i}"} = $value if CORE::defined $value;

      push @values, $value;
    }

    codify($code, $refs)->(@values, @args);
  }

  return $data;
}

sub each_value {
  my ($data, $code, @args) = @_;

  for my $key (CORE::keys %$data) {
    my $value = $data->{$key};
    my $refs = {'$key' => \$key, '$value' => \$value};
    codify($code, $refs)->($value, @args);
  }

  return $data;
}

sub empty {
  my ($data) = @_;

  CORE::delete @$data{CORE::keys %$data};

  return $data;
}

sub eq {
  my ($data) = @_;

  throw($data, "The eq() comparison operation is not supported");
}

sub exists {
  my ($data, $key) = @_;

  return CORE::exists $data->{$key};
}

sub filter_exclude {
  my ($data, @args) = @_;

  my %i = map { $_ => $_ } @args;

  return {
    CORE::map { CORE::exists($data->{$_}) ? ($_ => $data->{$_}) : () }
      CORE::grep { not CORE::exists($i{$_}) } CORE::keys %$data
  };
}

sub filter_include {
  my ($data, @args) = @_;

  return {
    CORE::map { CORE::exists($data->{$_}) ? ($_ => $data->{$_}) : () }
      @args
  };
}

sub fold {
  my ($data, $path, $store, $cache) = @_;

  $store ||= {};
  $cache ||= {};

  my $ref = CORE::ref($data);
  my $obj = Scalar::Util::blessed($data);
  my $adr = Scalar::Util::refaddr($data);
  my $tmp = {%$cache};

  if ($adr && $tmp->{$adr}) {
    $store->{$path} = $data;
  } elsif ($ref eq 'HASH' || ($obj and $obj->isa('Data::Object::Hash'))) {
    $tmp->{$adr} = 1;
    if (%$data) {
      for my $key (CORE::sort(CORE::keys %$data)) {
        my $place = $path ? CORE::join('.', $path, $key) : $key;
        my $value = $data->{$key};
        fold($value, $place, $store, $tmp);
      }
    } else {
      $store->{$path} = {};
    }
  } elsif ($ref eq 'ARRAY' || ($obj and $obj->isa('Data::Object::Array'))) {
    $tmp->{$adr} = 1;
    if (@$data) {
      for my $idx (0 .. $#$data) {
        my $place = $path ? CORE::join(':', $path, $idx) : $idx;
        my $value = $data->[$idx];
        fold($value, $place, $store, $tmp);
      }
    } else {
      $store->{$path} = [];
    }
  } else {
    $store->{$path} = $data if $path;
  }

  return $store;
}

sub ge {
  my ($data) = @_;

  throw($data, "The ge() comparison operation is not supported");
}

sub get {
  my ($data, $key) = @_;

  return $data->{$key};
}

sub grep {
  my ($data, $code, @args) = @_;

  my @caught;

  for my $key (CORE::keys %$data) {
    my $value = $data->{$key};
    my $refs = {'$key' => \$key, '$value' => \$value};
    my $result = codify($code, $refs)->($value, @args);
    push @caught, $key, $value if $result;
  }

  return {@caught};
}

sub gt {
  my ($data) = @_;

  throw($data, "The gt() comparison operation is not supported");
}

sub head {
  my ($data) = @_;

  throw($data, "The head() comparison operation is not supported");
}

sub invert {
  goto \&reverse;
}

sub iterator {
  my ($data) = @_;

  my @keys = CORE::keys %{$data};

  my $i = 0;
  return sub {
    return undef if $i > $#keys;
    return $data->{$keys[$i++]};
  }
}

sub join {
  my ($data) = @_;

  throw($data, "The join() comparison operation is not supported");
}

sub keys {
  my ($data) = @_;

  return [CORE::keys %$data];
}

sub le {
  my ($data) = @_;

  throw($data, "The le() comparison operation is not supported");
}

sub length {
  my ($data) = @_;

  return scalar CORE::keys %$data;
}

sub list {
  my ($data) = @_;

  return [%$data];
}

sub lookup {
  my ($data, $path) = @_;

  return undef
    unless ($data and $path)
    and (('HASH' eq ref($data))
    or Scalar::Util::blessed($data) and $data->isa('HASH'));

  return $data->{$path} if $data->{$path};

  my $next;
  my $rest;

  ($next, $rest) = $path =~ /(.*)\.([^\.]+)$/;
  return lookup($data->{$next}, $rest) if $next and $data->{$next};

  ($next, $rest) = $path =~ /([^\.]+)\.(.*)$/;
  return lookup($data->{$next}, $rest) if $next and $data->{$next};

  return undef;
}

sub lt {
  my ($data) = @_;

  throw($data, "The lt() comparison operation is not supported");
}

sub map {
  my ($data, $code, @args) = @_;

  my @caught;

  for my $key (CORE::keys %$data) {
    my $value = $data->{$key};
    my $refs = {'$key' => \$key, '$value' => \$value};
    push @caught, (codify($code, $refs)->($key, @args));
  }

  return [@caught];
}

sub merge {
  my ($data, @args) = @_;

  require Storable;

  return Storable::dclone($data) if !@args;
  return Storable::dclone(merge($data, merge(@args))) if @args > 1;

  my ($right) = @args;
  my (%merge) = %$data;

  for my $key (CORE::keys %$right) {
    my $lprop = $$data{$key};
    my $rprop = $$right{$key};

    $merge{$key}
      = ((ref($rprop) eq 'HASH') and (ref($lprop) eq 'HASH'))
      ? merge($$data{$key}, $$right{$key})
      : $$right{$key};
  }

  return Storable::dclone(\%merge);
}

sub ne {
  my ($data) = @_;

  throw($data, "The ne() comparison operation is not supported");
}

sub pairs {
  my ($data) = @_;

  return [CORE::map { [$_, $data->{$_}] } CORE::keys(%$data)];
}

sub reset {
  my ($data) = @_;

  @$data{CORE::keys(%$data)} = ();

  return $data;
}

sub reverse {
  my ($data) = @_;

  my $retv = {};

  for (CORE::keys %$data) {
    if (CORE::defined($data->{$_})) {
      $retv->{$_} = $data->{$_};
    }
  }

  return {CORE::reverse %$retv};
}

sub set {
  my ($data, $key, $value) = @_;

  return $data->{$key} = $value;
}

sub slice {
  my ($data, @args) = @_;

  return {CORE::map { $_ => $data->{$_} } @args};
}

sub sort {
  my ($data) = @_;

  throw($data, "The sort() comparison operation is not supported");
}

sub tail {
  my ($data) = @_;

  throw($data, "The tail() comparison operation is not supported");
}

sub unfold {
  my ($data) = @_;

  my $store = {};

  for my $key (CORE::sort(CORE::keys(%$data))) {
    my $node  = $store;
    my @steps = CORE::split(/\./, $key);

    for (my $i = 0; $i < @steps; $i++) {
      my $last = $i == $#steps;
      my $step = $steps[$i];

      if (my @parts = $step =~ /^(\w*):(0|[1-9]\d*)$/) {
        $node = $node->{$parts[0]}[$parts[1]]
          = $last ? $data->{$key}
          : exists $node->{$parts[0]}[$parts[1]] ? $node->{$parts[0]}[$parts[1]]
          : {};
      } else {
        $node = $node->{$step}
          = $last ? $data->{$key} : exists $node->{$step} ? $node->{$step} : {};
      }
    }
  }

  return $store;
}

sub values {
  my ($data, @args) = @_;

  return [@args ? @{$data}{@args} : CORE::values(%$data)];
}

1;
