package Data::Object::State;

use strict;
use warnings;

use parent 'Data::Object::Class';

# VERSION

# BUILD

sub import {
  my ($class, @args) = @_;

  my $target = caller;

  eval "package $target; use Data::Object::Class; 1;";

  no strict 'refs';

  *{"${target}::BUILD"} = $class->can('BUILD');
  *{"${target}::renew"} = $class->can('renew');

  return;
}

sub BUILD {
  my ($self, $args) = @_;

  my $class = ref($self) || $self;

  no strict 'refs';

  ${"${class}::data"} = {%$self, %$args} if !${"${class}::data"};

  $_[0] = bless ${"${class}::data"}, $class;

  return $class;
}

# METHODS

sub renew {
  my ($self, @args) = @_;

  my $class = ref($self) || $self;

  no strict 'refs';

  undef ${"${class}::data"};

  return $class->new(@args);
}

1;
