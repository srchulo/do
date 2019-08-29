package Data::Object::Role::Dumper;

use 5.014;

use strict;
use warnings;

use Moo::Role;

# VERSION

# BUILD
# METHODS

sub dump {
  my ($data) = @_;

  require Data::Dumper;
  require Data::Object::Export;

  no warnings 'once';

  local $Data::Dumper::Indent = 0;
  local $Data::Dumper::Purity = 0;
  local $Data::Dumper::Quotekeys = 0;
  local $Data::Dumper::Deepcopy = 1;
  local $Data::Dumper::Deparse = 1;
  local $Data::Dumper::Sortkeys = 1;
  local $Data::Dumper::Terse = 1;
  local $Data::Dumper::Useqq = 1;

  $data = Data::Object::Export::detract_deep($_[0]);
  $data = Data::Dumper::Dumper($data);
  $data =~ s/^"|"$//g;

  return $data;
}

1;
