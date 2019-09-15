package Data::Object::Role::Dumpable;

use 5.014;

use strict;
use warnings;

use Moo::Role;

# VERSION

# METHODS

sub dump {
  my ($data) = @_;

  require Data::Dumper;
  require Data::Object::Utility;

  no warnings 'once';

  local $Data::Dumper::Indent = 0;
  local $Data::Dumper::Purity = 0;
  local $Data::Dumper::Quotekeys = 0;
  local $Data::Dumper::Deepcopy = 1;
  local $Data::Dumper::Deparse = 1;
  local $Data::Dumper::Sortkeys = 1;
  local $Data::Dumper::Terse = 1;
  local $Data::Dumper::Useqq = 1;

  $data = Data::Object::Utility::DetractDeep($_[0]);
  $data = Data::Dumper::Dumper($data);
  $data =~ s/^"|"$//g;

  return $data;
}

sub print {
  my ($self, @args) = @_;

  return CORE::print(map &dump($_), @args, $self);
}

sub say {
  my ($self, @args) = @_;

  return CORE::print(map +(&dump($_), "\n"), @args, $self);
}

sub pretty_dump {
  my ($data) = @_;

  require Data::Dumper;
  require Data::Object::Utility;

  no warnings 'once';

  local $Data::Dumper::Indent = 2;
  local $Data::Dumper::Trailingcomma = 1;
  local $Data::Dumper::Purity = 0;
  local $Data::Dumper::Pad = '';
  local $Data::Dumper::Varname = 'VAR';
  local $Data::Dumper::Useqq = 0;
  local $Data::Dumper::Terse = 1;
  local $Data::Dumper::Freezer = '';
  local $Data::Dumper::Toaster = '';
  local $Data::Dumper::Deepcopy = 1;
  local $Data::Dumper::Quotekeys = 0;
  local $Data::Dumper::Bless = 'bless';
  local $Data::Dumper::Pair = ' => ';
  local $Data::Dumper::Maxdepth = 0;
  local $Data::Dumper::Maxrecurse = 1000;
  local $Data::Dumper::Useperl = 0;
  local $Data::Dumper::Sortkeys = 1;
  local $Data::Dumper::Deparse = 1;
  local $Data::Dumper::Sparseseen = 0;

  $data = Data::Object::Utility::DetractDeep($_[0]);
  $data = Data::Dumper::Dumper($data);
  $data =~ s/^'|'$//g;

  return $data;
}

sub pretty_print {
  my ($self, @args) = @_;

  return CORE::print(map &pretty_dump($_), @args, $self);
}

sub pretty_say { goto &pretty_print }

1;
