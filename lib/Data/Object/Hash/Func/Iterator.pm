package Data::Object::Hash::Func::Iterator;

use 5.014;

use strict;
use warnings;

use Data::Object 'Class';

extends 'Data::Object::Hash::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'HashLike',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  my @keys = sort keys %{$data};

  my $i = 0;
  return sub {
    return undef if $i > $#keys;
    return $data->{$keys[$i++]};
  }
}

sub mapping {
  return ('arg1');
}

1;
