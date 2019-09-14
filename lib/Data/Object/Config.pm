package Data::Object::Config;

use 5.014;

use strict;
use warnings;

use Carp ();

use Import::Into;

# VERSION

# BUILD

sub import {
  my ($class, $type, $meta) = @_;

  my $target = caller;

  process($target, prepare($class, $type), $type, $meta);

  return;
}

# METHODS

sub choose {
  my ($type) = @_;

  # * special config pl
  if (subject($type, 'pl')) {
    return ['config_cli', 1];
  }

  # * special config pm
  if (subject($type, 'pm')) {
    return ['config_class', 1];
  }

  # config cli
  if (subject($type, 'cli')) {
    return ['config_cli', 1];
  }

  # * special config core
  if (subject($type, 'core')) {
    return ['config_core', 1];
  }

  # config array
  if (subject($type, 'array')) {
    return ['config_array', 1];
  }

  # config code
  if (subject($type, 'code')) {
    return ['config_code', 1];
  }

  # config dispatch
  if (subject($type, 'dispatch')) {
    return ['config_dispatch', 1];
  }

  # config exception
  if (subject($type, 'exception')) {
    return ['config_exception', 1];
  }

  # config float
  if (subject($type, 'float')) {
    return ['config_float', 1];
  }

  # config hash
  if (subject($type, 'hash')) {
    return ['config_hash', 1];
  }

  # config integer
  if (subject($type, 'integer')) {
    return ['config_integer', 1];
  }

  # config base
  if (subject($type, 'base')) {
    return ['config_base', 1];
  }

  # config number
  if (subject($type, 'number')) {
    return ['config_number', 1];
  }

  # config regexp
  if (subject($type, 'regexp')) {
    return ['config_regexp', 1];
  }

  # config replace
  if (subject($type, 'replace')) {
    return ['config_replace', 1];
  }

  # config scalar
  if (subject($type, 'scalar')) {
    return ['config_scalar', 1];
  }

  # config search
  if (subject($type, 'search')) {
    return ['config_search', 1];
  }

  # config state
  if (subject($type, 'state')) {
    return ['config_state', 1];
  }

  # config string
  if (subject($type, 'string')) {
    return ['config_string', 1];
  }

  # config struct
  if (subject($type, 'struct')) {
    return ['config_struct', 1];
  }

  # config type
  if (subject($type, 'type')) {
    return ['config_type', 1];
  }

  # config library
  if (subject($type, 'library')) {
    return ['config_library', 1];
  }

  # config undef
  if (subject($type, 'undef')) {
    return ['config_undef', 1];
  }

  # config class
  if (subject($type, 'class')) {
    return ['config_class', 1];
  }

  # config role
  if (subject($type, 'role')) {
    return ['config_role', 1];
  }

  # config rule
  if (subject($type, 'rule')) {
    return ['config_rule', 1];
  }

  # config dumpable
  if (subject($type, 'withdumpable')) {
    return ['config_withdumpable', 0];
  }

  # config immutable
  if (subject($type, 'withimmutable')) {
    return ['config_withimmutable', 0];
  }

  # config proxyable
  if (subject($type, 'withproxyable')) {
    return ['config_withproxyable', 0];
  }

  # config stashable
  if (subject($type, 'withstashable')) {
    return ['config_withstashable', 0];
  }

  # config throwable
  if (subject($type, 'withthrowable')) {
    return ['config_withthrowable', 0];
  }

  return ['config_core', 1];
}

sub prepare {
  my ($class, $type) = @_;

  my $plans;
  my $choice = choose($type);

  my $config = $choice->[0];
  my $wrapped = $choice->[1];

  no strict 'refs';

  $plans = &{$config}();

  return $wrapped ? config($plans) : $plans;
}

sub process {
  my ($target, $plans, $type, $meta) = @_;

  for my $plan (@$plans) {
    if ($plan->[0] eq 'add') {
      process_add($target, $plan);
    }
    if ($plan->[0] eq 'call') {
      process_call($target, $plan);
    }
    if ($plan->[0] eq 'let') {
      process_let($target, $plan);
    }
    if ($plan->[0] eq 'use') {
      process_use($target, $plan);
    }
  }

  # experimental auto-register type
  _process_meta($target, $type, $meta) if $meta;

  return;
}

sub prepare_add {
  my ($class, $func) = @_;

  return ['add', $class, $func];
}

sub process_add {
  my ($target, $plan) = @_;

  my ($action, $package, $name) = @$plan;

  no warnings 'redefine', 'prototype';

  *{"${target}::${name}"} = $package->can($name);

  return;
}

sub prepare_call {
  my ($func, @args) = @_;

  return ['call', $func, @args];
}

sub process_call {
  my ($target, $plan) = @_;

  my ($action, $name, @args) = @$plan;

  $target->can($name)->(@args);

  return;
}

sub prepare_let {
  my (@args) = @_;

  return ['let', @args];
}

sub process_let {
  my ($target, $plan) = @_;

  my ($action, @args) = @$plan;

  eval join ' ', "package $target;", @args;

  return;
}

sub prepare_use {
  my ($class, @args) = @_;

  return ['use', $class, @args];
}

sub process_use {
  my ($target, $plan) = @_;

  my ($action, $package, @args) = @$plan;

  import::into($package, $target, @args);

  return;
}

sub subject {
  my ($type, $name) = @_;

  return 0 if !$type;

  $type =~ s/^\W//g;

  return 1 if lc($type) eq lc($name);

  return 0;
}

sub config {
  [
    # basics
    prepare_use('strict'),
    prepare_use('warnings'),

    # say, state, switch, unicode_strings, array_base
    prepare_use('feature', ':5.14'),

    # types and signatures
    prepare_use('Data::Object::Library'),
    prepare_use('Data::Object::Signatures'),
    prepare_use('Data::Object::Autobox'),

    # contextual
    ($_[0] ? @{$_[0]} : ()),

    # tools and functions, and "do" function
    prepare_use('Data::Object::Export'),

    # make special "do" function work
    prepare_use('subs', 'do')
  ]
}

sub config_args {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Args')
  ]
}

sub config_array {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Array')
  ]
}

sub config_class {
  [
    prepare_use('Data::Object::Class'),
    prepare_use('Data::Object::ClassHas')
  ]
}

sub config_cli {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Cli')
  ]
}

sub config_code {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Code')
  ]
}

sub config_core {
  []
}

sub config_data {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Data')
  ]
}

sub config_dispatch {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Dispatch')
  ]
}

sub config_exception {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Exception')
  ]
}

sub config_float {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Float')
  ]
}

sub config_hash {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Hash')
  ]
}

sub config_base {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Base')
  ]
}

sub config_number {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Number')
  ]
}

sub config_opts {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Opts')
  ]
}

sub config_regexp {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Regexp')
  ]
}

sub config_replace {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Replace')
  ]
}

sub config_role {
  [
    prepare_use('Data::Object::Role'),
    prepare_use('Data::Object::RoleHas')
  ]
}

sub config_rule {
  [
    prepare_use('Data::Object::Rule'),
    prepare_use('Data::Object::RoleHas')
  ]
}

sub config_scalar {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Scalar')
  ]
}

sub config_search {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Search')
  ]
}

sub config_space {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Space')
  ]
}

sub config_state {
  [
    prepare_use('Data::Object::State'),
    prepare_use('Data::Object::ClassHas')
  ]
}

sub config_string {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::String')
  ]
}

sub config_struct {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Struct')
  ]
}

sub config_type {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Base')
  ]
}

sub config_library {
  [
    prepare_use('Type::Library', '-base'),
    prepare_use('Type::Utils', '-all'),
    prepare_let('BEGIN { extends("Data::Object::Library"); }')
  ]
}

sub config_undef {
  [
    prepare_use('Role::Tiny::With'),
    prepare_use('parent', 'Data::Object::Undef')
  ]
}

sub config_vars {
  [
    @{config_class()},
    prepare_call('extends', 'Data::Object::Vars')
  ]
}

sub config_withdumpable {
  [
    prepare_call('with', 'Data::Object::Role::Dumpable')
  ]
}

sub config_withimmutable {
  [
    prepare_call('with', 'Data::Object::Role::Immutable')
  ]
}

sub config_withproxyable {
  [
    prepare_call('with', 'Data::Object::Role::Proxyable')
  ]
}

sub config_withstashable {
  [
    prepare_call('with', 'Data::Object::Role::Stashable')
  ]
}

sub config_withthrowable {
  [
    prepare_call('with', 'Data::Object::Role::Throwable')
  ]
}

# experimental
sub _process_meta {
  my ($target, $type, $meta) = @_;

  my $parent;

  # get the plan name
  my $config = choose($type) || '';

  # set the parent type
  if (!$parent && $config->[0] eq 'config_role') {
    $parent = 'ConsumerOf';
  }
  if (!$parent && $config->[0] eq 'config_rule') {
    $parent = 'ConsumerOf';
  }
  if (!$parent) {
    $parent = 'InstanceOf';
  }

  # map target to typelib
  my $namespace = _process_typelib($target, $meta);

  # attempt to load the type library from disk if not already loaded
  eval "require $namespace";

  # ensure that the type library is valid and operable
  Carp::confess("$namespace is not a valid type library")
    unless $namespace->isa('Type::Library');

  # build type-tiny constraint for target, then add constraint to typelib
  _process_typereg($namespace, _process_typetiny(Data::Object::Export::registry(),
      $target, $parent));

  return;
}

# experimental
sub _process_typelib {
  my ($target, $meta) = @_;

  # register target <-> typelib so target can use typelib
  return Data::Object::Export::namespace($target, ref($meta)
    ? join('-', @$meta) : $meta);
}

# experimental
sub _process_typereg {
  my ($namespace, $constraint) = @_;

  # add type constraint to the user-defined type-library
  return $namespace->get_type($constraint->name)
    || $namespace->add_type($constraint);
}

# experimental
sub _process_typetiny {
  my ($registry, $target, $reference) = @_;

  # core typelib has InstanceOf and ConsumerOf type objects
  my $library = 'Data::Object::Library';

  # type constraint name from target package name
  my $name = ucfirst $target =~ s/\W//gr;

  # new parameterized InstanceOf or ConsumerOf for target
  my $parent = $library->get_type($reference)->of($target);

  # return new type-tiny type constraint
  return Type::Tiny->new(name => $name, parent => $parent);
}

1;
