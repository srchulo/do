package Data::Object::Export;

use strict;
use warnings;

use Carp;
use Scalar::Util;

use parent 'Exporter';

# VERSION

# BUILD

our @CORE = (
  'cast',
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
  'throw'
);

our @DATA = (
  'data_any',
  'data_array',
  'data_code',
  'data_data',
  'data_dispatch',
  'data_exception',
  'data_float',
  'data_hash',
  'data_integer',
  'data_number',
  'data_regexp',
  'data_scalar',
  'data_space',
  'data_string',
  'data_undef'
);

our @TYPE = (
  'type_any',
  'type_array',
  'type_code',
  'type_data',
  'type_dispatch',
  'type_exception',
  'type_float',
  'type_hash',
  'type_integer',
  'type_number',
  'type_regexp',
  'type_scalar',
  'type_space',
  'type_string',
  'type_undef'
);

our @PLUS = (
  @Carp::EXPORT,
  'class_file',
  'class_name',
  'class_path',
  'library',
  'namespace',
  'path_class',
  'path_name',
  'registry',
  'reify',
  'typify'
);

our @EXPORT = (
  'do'
);

our @EXPORT_OK = (
  @CORE,
  @DATA,
  @TYPE,
  @PLUS
);

our %EXPORT_TAGS = (
  core => [@CORE],
  data => [@DATA],
  type => [@TYPE],
  all  => [@EXPORT_OK],
  plus => [@PLUS]
);

# PROXY

sub do {
  unless (grep length, grep defined, @_) {
    croak "Null filename used";
  }

  return CORE::do($_[0]) if @_ < 2;

  my $point;

  my $routine = shift;
  my $package = __PACKAGE__;

  # it's fun to do bad things {0_0}
  unless ($package && $routine) {
    croak "Can't make call without a package and function";
  }

  unless ($point = $package->can($routine)) {
    croak "Function ($routine) not callable on package ($package)";
  }

  goto $point;
}

# JUMPERS

sub data_any {
  my $class = 'Data::Object::Any';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_array {
  my $class = 'Data::Object::Array';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_code {
  my $class = 'Data::Object::Code';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_data {
  my $class = 'Data::Object::Data';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_dispatch {
  my $class = 'Data::Object::Dispatch';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_exception {
  my $class = 'Data::Object::Exception';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_float {
  my $class = 'Data::Object::Float';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_hash {
  my $class = 'Data::Object::Hash';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_integer {
  my $class = 'Data::Object::Integer';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_number {
  my $class = 'Data::Object::Number';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_regexp {
  my $class = 'Data::Object::Regexp';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_scalar {
  my $class = 'Data::Object::Scalar';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_space {
  my $class = 'Data::Object::Space';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_string {
  my $class = 'Data::Object::String';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub data_undef {
  my $class = 'Data::Object::Undef';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub immutable {
  my $class = 'Data::Object::Immutable';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub library {
  my $class = 'Data::Object::Library';
  my $point = load($class)->can('meta');

  unshift @_, $class and goto $point;
}

sub prototype {
  my $class = 'Data::Object::Prototype';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub registry {
  my $class = 'Data::Object::Registry';
  my $point = load($class)->can('new');

  unshift @_, $class and goto $point;
}

sub reify {
  my ($from, $expr) = @_;

  my $class = registry()->obj($from);
  my $point = $class->can('lookup');

  @_ = ($class, $expr) and goto $point;
}

sub throw {
  my $class = 'Data::Object::Exception';
  my $point = load($class)->can('throw');

  unshift @_, $class and goto $point;
}

# FUNCTIONS

sub cast {
  goto &deduce_deep;
}

sub const {
  my ($name, $data) = @_;

  my $class = caller(0);
  my $fqsub = $name =~ /(::|')/ ? $name : "${class}::${name}";

  no strict 'refs';
  no warnings 'redefine';

  *{$fqsub} = sub () { (ref $data eq "CODE") ? goto &$data : $data };

  return $data;
}

sub dispatch {
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
    return sub {
      my $call = shift;
      my $next = $package->can($call);

      if (!$next && !$call) {
        die "Can't dispatch to $package without routine";
      }
      if (!$next && $call) {
        die "Can't create dispatcher for $call in $package";
      }

      goto $next;
    };
  }

  my $currier = $package->can($sub);

  if (!$currier) {
    die "Can't create dispatcher for $sub in $package";
  }

  return sub { unshift @_, @args if @args; goto $currier };
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

sub load {
  my ($class) = @_;

  my $failed = !$class || $class !~ /^[\D](?:[\w:']*\w)?$/;
  my $loaded;

  croak "Invalid package name ($class)" if $failed;

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

sub namespace {
  my ($package, $libname) = @_;

  my $registry = registry();

  my $namespace = path_class($libname);

  $registry->set($package, $namespace);

  return $namespace;
}

# DEDUCERS

sub deduce {
  my ($data) = @_;

  return data_undef($data) if not defined $data;
  return deduce_blessed($data) if Scalar::Util::blessed $data;
  return deduce_defined($data);
}

sub deduce_defined {
  my ($data) = @_;

  return deduce_references($data) if ref $data;
  return deduce_numberlike($data) if Scalar::Util::looks_like_number $data;
  return deduce_stringlike($data);
}

sub deduce_blessed {
  my ($data) = @_;

  return data_regexp($data) if $data->isa('Regexp');
  return $data;
}

sub deduce_references {
  my ($data) = @_;

  return data_array($data) if 'ARRAY' eq ref $data;
  return data_code($data) if 'CODE' eq ref $data;
  return data_hash($data) if 'HASH' eq ref $data;
  return data_scalar($data); # glob, etc
}

sub deduce_numberlike {
  my ($data) = @_;

  return data_float($data) if $data =~ /\./;
  return data_number($data) if $data =~ /^\d[_\d]*$/;
  return data_integer($data);
}

sub deduce_stringlike {
  my ($data) = @_;

  return data_string($data);
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

sub deduce_type {
  my ($data) = (deduce $_[0]);

  return "ANY" if $data->isa("Data::Object::Any");
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

  return undef;
}

sub detract {
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

  if ($type eq 'ANY' or $type eq 'SCALAR') {
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
    return sub { goto $data };
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

# MISCELLANOUS

sub class_file {
  my ($class) = @_;
  $class =~ s/::|'//g;
  $class =~ s/([A-Z])([A-Z]*)/$1 . lc $2/ge;
  return path_name($class);
}

sub class_name {
  my ($string) = @_;
  if ($string =~ /^[A-Z]/) {
    return $string;
  } else {
    my @parts = split '-', $string;
    return join '::', map { join('', map { ucfirst lc } split '_') } @parts;
  }
}

sub class_path {
  my ($class) = @_;
  return join '.', join('/', split(/::|'/, $class)), 'pm';
}

sub path_class {
  my ($path) = @_;
  return join '::', map class_name($_), grep {length} split /\W/, $path;
}

sub path_name {
  my ($string) = @_;
  if ($string !~ /^[A-Z]/) {
    return $string;
  } else {
    my @parts = map {
      join('_', map {lc} grep {length} split /([A-Z]{1}[^A-Z]*)/)
    } split '::', $string;
    return join '-', @parts;
  }
}

# ALIASES

{
  no warnings 'once';

  # aliases
  *any = *data_any;
  *array = *data_array;
  *code = *data_code;
  *data = *data_data;
  *dispatch = *data_dispatch;
  *exception = *data_exception;
  *float = *data_float;
  *hash = *data_hash;
  *integer = *data_integer;
  *number = *data_number;
  *regexp = *data_regexp;
  *scalar = *data_scalar;
  *space = *data_space;
  *string = *data_string;
  *undef = *data_undef;

  # aliases (backwards compatibility)
  *type_any = *data_any;
  *type_array = *data_array;
  *type_code = *data_code;
  *type_data = *data_data;
  *type_dispatch = *data_dispatch;
  *type_exception = *data_exception;
  *type_float = *data_float;
  *type_hash = *data_hash;
  *type_integer = *data_integer;
  *type_number = *data_number;
  *type_regexp = *data_regexp;
  *type_scalar = *data_scalar;
  *type_space = *data_space;
  *type_string = *data_string;
  *type_undef = *data_undef;
}

1;
