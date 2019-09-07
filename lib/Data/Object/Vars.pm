package Data::Object::Vars;

use 5.014;

use strict;
use warnings;

use Moo;

extends 'Data::Object::Hash';

# VERSION

# BUILD

around new => sub {
  my ($orig, $class, $data) = @_;

  my $self = $class->$orig($data || {});

  $self->{$_} = $ENV{$_} for keys %ENV;

  return $self;
};

sub space {
  my ($self) = @_;

  my $class = 'Data::Object::Hash';

  require Data::Object::Space;

  return Data::Object::Space->new($class);
}

1;
