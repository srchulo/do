# ABSTRACT: Exportable Functions for Perl 5
package Data::Object::Export;

use 5.014;

use strict;
use warnings;

use Carp;
use Scalar::Util;
use Sub::Quote;

use parent 'Exporter';

# VERSION

our @CORE = (
  'cast',
  'codify',
  'const',
  'deduce',
  'deduce_deep',
  'deduce_type',
  'detract',
  'detract_deep',
  'dispatch',
  'dump',
  'immutable',
  'load',
  'prototype',
  'reify',
  'throw'
);

our @DATA = (
  'data_array',
  'data_code',
  'data_float',
  'data_hash',
  'data_integer',
  'data_number',
  'data_regexp',
  'data_scalar',
  'data_string',
  'data_undef',
  'data_universal'
);

our @TYPE = (
  'type_array',
  'type_code',
  'type_float',
  'type_hash',
  'type_integer',
  'type_number',
  'type_regexp',
  'type_scalar',
  'type_string',
  'type_undef',
  'type_universal'
);

our @PLUS = (
  @Carp::EXPORT
);

our @VARS = (
  '$dispatch'
);

our @EXPORT_OK = (
    @CORE,
    @DATA,
    @TYPE,
    @PLUS,
    @VARS
);

our %EXPORT_TAGS = (
  core => [@CORE],
  data => [@DATA],
  type => [@TYPE],
  all  => [@EXPORT_OK],
  plus => [@PLUS],
  vars => [@VARS]
);

sub cast($) {
  goto &deduce_deep;
}

sub const ($$) {
  my ($name, $data) = @_;

  my $class = caller(0);
  my $fqsub = $name =~ /(::|')/ ? $name : "${class}::${name}";

  no strict 'refs';
  no warnings 'redefine';

  *{$fqsub} = sub () { (ref $data eq "CODE") ? goto &$data : $data };

  return $data;
}

sub codify ($;$) {
  my ($code, $refs) = @_;

  $code = reify($code);

  if ($code->type eq 'UNDEF') {
    # as you were !!!
    $code = q{ @_ };
  } elsif ($code->type eq 'CODE') {
    my $func = $code;
    # perform inception !!!
    $refs->{'$exec'} = \$func;
    $code = q{ goto &{$exec} };
  }

  # (facepalm) purely for backwards compatibility
  my $vars = sprintf 'my ($%s) = @_;', join ',$', 'a' .. 'z';
  my $body = sprintf '%s do { %s; }', $vars, "$code" // '@_';
  my $func = Sub::Quote::quote_sub($body, ref($refs) ? $refs : {});

  return $func;
}

sub immutable ($) {
  my $class = load("Data::Object::Immutable");

  unshift @_, $class and goto $class->can('new');
}

sub load ($) {
  my ($class) = @_;

  my $failed = !$class || $class !~ /^\w(?:[\w:']*\w)?$/;
  my $loaded;

  my $error = do {
    local $@;
    $loaded = $class->can('new') || eval "require $class; 1";
    $@;
  };

  croak "Error attempting to load $class: $error"
    if $error
    or $failed
    or not $loaded;

  return $class;
}

sub dispatch(@) {
  my ($class, $sub, @args) = @_;

  return if !$class;

  my $package;

  if (!Scalar::Util::blessed($class)) {
    load($class);
    $package = $class;
  } else {
    unshift @args, $class;
    $package = ref $class;
  }

  if (!$sub) {
    return sub { my $sub = $package->can(shift); $sub->(@_) };
  }

  my $currier = $package->can($sub);

  if (!$currier) {
    die "Can't create dispatcher for $sub from $package";
  }

  return sub { @args ? $currier->(@args, @_) : $currier->(@_) };
}

sub prototype (@) {
  my $class = load("Data::Object::Prototype");

  unshift @_, $class and goto $class->can('new');
}

sub reify ($) {
  goto &deduce_deep;
}

sub throw (@) {
  my $class = load("Data::Object::Exception");

  unshift @_, $class and goto $class->can('throw');
}

sub data_array ($) {
  my $class = load("Data::Object::Array");

  unshift @_, $class and goto $class->can('new');
}

sub data_code ($) {
  my $class = load("Data::Object::Code");

  unshift @_, $class and goto $class->can('new');
}

sub data_float ($) {
  my $class = load("Data::Object::Float");

  unshift @_, $class and goto $class->can('new');
}

sub data_hash ($) {
  my $class = load("Data::Object::Hash");

  unshift @_, $class and goto $class->can('new');
}

sub data_integer ($) {
  my $class = load("Data::Object::Integer");

  unshift @_, $class and goto $class->can('new');
}

sub data_number ($) {
  my $class = load("Data::Object::Number");

  unshift @_, $class and goto $class->can('new');
}

sub data_regexp ($) {
  my $class = load("Data::Object::Regexp");

  unshift @_, $class and goto $class->can('new');
}

sub data_scalar ($) {
  my $class = load("Data::Object::Scalar");

  unshift @_, $class and goto $class->can('new');
}

sub data_string ($) {
  my $class = load("Data::Object::String");

  unshift @_, $class and goto $class->can('new');
}

sub data_undef (;$) {
  my $class = load("Data::Object::Undef");

  unshift @_, $class and goto $class->can('new');
}

sub data_universal ($) {
  my $class = load("Data::Object::Universal");

  unshift @_, $class and goto $class->can('new');
}

sub deduce ($) {
  my ($data) = @_;

  return data_undef($data) if not defined $data;
  return deduce_blessed($data) if Scalar::Util::blessed $data;
  return deduce_defined($data);
}

sub deduce_defined($) {
  my ($data) = @_;

  return deduce_references($data) if ref $data;
  return deduce_numberlike($data) if Scalar::Util::looks_like_number $data;
  return deduce_stringlike($data);
}

sub deduce_blessed($) {
  my ($data) = @_;

  return data_regexp($data) if $data->isa('Regexp');
  return $data;
}

sub deduce_references($) {
  my ($data) = @_;

  return data_array($data) if 'ARRAY' eq ref $data;
  return data_code($data) if 'CODE' eq ref $data;
  return data_hash($data) if 'HASH' eq ref $data;
  return data_scalar($data); # glob, etc
}

sub deduce_numberlike($) {
  my ($data) = @_;

  return data_float($data) if $data =~ /\./;
  return data_number($data) if $data =~ /^\d[_\d]*$/;
  return data_integer($data);
}

sub deduce_stringlike($) {
  my ($data) = @_;

  return data_string($data);
}

sub deduce_scalars($) {
  my ($data) = @_;

  return data_scalar($data);
}

sub deduce_deep {
  my @data = map deduce($_), @_;

  for my $data (@data) {
    my $type = deduce_type($data);

    if ($type and $type eq 'HASH') {
      for my $i (keys %$data) {
        my $val = $data->{$i};
        $data->{$i} = ref($val) ? deduce_deep($val) : deduce($val);
      }
    }
    if ($type and $type eq 'ARRAY') {
      for (my $i = 0; $i < @$data; $i++) {
        my $val = $data->[$i];
        $data->[$i] = ref($val) ? deduce_deep($val) : deduce($val);
      }
    }
  }

  return wantarray ? (@data) : $data[0];
}

sub deduce_type ($) {
  my ($data) = (deduce $_[0]);

  return "ARRAY" if $data->isa("Data::Object::Array");
  return "HASH" if $data->isa("Data::Object::Hash");
  return "CODE" if $data->isa("Data::Object::Code");
  return "FLOAT" if $data->isa("Data::Object::Float");
  return "NUMBER" if $data->isa("Data::Object::Number");
  return "INTEGER" if $data->isa("Data::Object::Integer");
  return "STRING" if $data->isa("Data::Object::String");
  return "SCALAR" if $data->isa("Data::Object::Scalar");
  return "REGEXP" if $data->isa("Data::Object::Regexp");
  return "UNDEF" if $data->isa("Data::Object::Undef");
  return "UNIVERSAL" if $data->isa("Data::Object::Universal");

  return undef;
}

sub detract ($) {
  my ($data) = (deduce $_[0]);

  my $type = deduce_type $data;

INSPECT:
  return $data unless $type;

  return [@$data] if $type eq 'ARRAY';
  return {%$data} if $type eq 'HASH';
  return $$data if $type eq 'REGEXP';
  return $$data if $type eq 'FLOAT';
  return $$data if $type eq 'NUMBER';
  return $$data if $type eq 'INTEGER';
  return $$data if $type eq 'STRING';
  return undef  if $type eq 'UNDEF';

  if ($type eq 'SCALAR' or $type eq 'UNIVERSAL') {
    $type = Scalar::Util::reftype($data) // '';

    return [@$data] if $type eq 'ARRAY';
    return {%$data} if $type eq 'HASH';
    return $$data if $type eq 'FLOAT';
    return $$data if $type eq 'INTEGER';
    return $$data if $type eq 'NUMBER';
    return $$data if $type eq 'REGEXP';
    return $$data if $type eq 'SCALAR';
    return $$data if $type eq 'STRING';
    return undef  if $type eq 'UNDEF';

    if ($type eq 'REF') {
      $type = deduce_type($data = $$data) and goto INSPECT;
    }
  }

  if ($type eq 'CODE') {
    return sub { goto &{$data} };
  }

  return undef;
}

sub detract_deep {
  my @data = map detract($_), @_;

  for my $data (@data) {
    if ($data and 'HASH' eq ref $data) {
      for my $i (keys %$data) {
        my $val = $data->{$i};
        $data->{$i} = ref($val) ? detract_deep($val) : detract($val);
      }
    }
    if ($data and 'ARRAY' eq ref $data) {
      for (my $i = 0; $i < @$data; $i++) {
        my $val = $data->[$i];
        $data->[$i] = ref($val) ? detract_deep($val) : detract($val);
      }
    }
  }

  return wantarray ? (@data) : $data[0];
}

sub dump {
  require Data::Dumper;

  no warnings 'once';

 local $Data::Dumper::Indent = 1;
 local $Data::Dumper::Purity = 1;
 local $Data::Dumper::Quotekeys = 0;
 local $Data::Dumper::Deepcopy = 1;
 local $Data::Dumper::Deparse = 1;
 local $Data::Dumper::Sortkeys = 1;
 local $Data::Dumper::Terse = 0;
 local $Data::Dumper::Useqq = 1;

  return Data::Dumper::Dumper(@_);
}

{
  # aliases
  no warnings 'once';

  *type_array     = *data_array;
  *type_code      = *data_code;
  *type_float     = *data_float;
  *type_hash      = *data_hash;
  *type_integer   = *data_integer;
  *type_number    = *data_number;
  *type_regexp    = *data_regexp;
  *type_scalar    = *data_scalar;
  *type_string    = *data_string;
  *type_undef     = *data_undef;
  *type_universal = *data_universal;
}

# dispatcher var
our $dispatch = dispatch(__PACKAGE__, 'dispatch');

1;
