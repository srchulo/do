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

1;
