package Data::Object::Export;

use 5.014;

use strict;
use warnings;

use Memoize;

use parent 'Exporter';

# VERSION

# BUILD

our @EXPORT = (
  'cast',
  'const',
  'do',
  'raise'
);

our %EXPORT_TAGS = (
  all => [@EXPORT]
);

# FUNCTIONS

sub do {
  unless (grep length, grep defined, @_) {
    keyraise("Null filename used");
  }

  return CORE::do($_[0]) if @_ < 2;

  my $point;

  my $routine = shift;
  my $package = __PACKAGE__;

  # it's fun to do bad things {0_0}
  unless ($package && $routine) {
    keyraise("Can't make call without a package and function");
  }

  unless ($point = $package->can($routine)) {
    keyraise("Function ($routine) not callable on package ($package)");
  }

  goto $point;
}

sub cast {
  require Data::Object::Utility;

  if ($_[1]) {
    my ($arg, $type) = @_;

    my $class = 'Data::Object';
    my $point = load($class)->can($type) or return;

    return $class->$type($arg);
  }

  goto &Data::Object::Utility::DeduceDeep;
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

  keyraise("Invalid package name ($class)") if $failed;

  my $error = do {
    local $@;
    $loaded = $class->can('new') || eval "require $class; 1";
    $@;
  };

  keyraise("Error attempting to load $class: $error")
    if $error
    or $failed
    or not $loaded;

  return $class;
}

sub raise {
  require Data::Object::Exception;

  my $class = 'Data::Object::Exception';
  my $point = Data::Object::Exception->can('throw');

  unshift @_, $class and goto $point;
}

sub keyraise {
  raise(shift, undef, 3);
}

memoize 'load';

1;
