use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

config_args

=usage

  my $plans = config_args;

=description

The config_args function returns plans for configuring the package to be a
L<Data::Object::Class> which extends L<Data::Object::Args>.

=signature

config_args() : ArrayRef

=type

method

=cut

# TESTING

use Data::Object::Config;

can_ok "Data::Object::Config", "config_args";

my $config = Data::Object::Config::config_args();

is_deeply $config, [
  ['use', 'Data::Object::Class'],
  ['use', 'Data::Object::ClassHas'],
  ['call', 'extends', 'Data::Object::Args']
];

ok 1 and done_testing;
