package Data::Object::Array::Func::Unique;

use Data::Object 'Class';

extends 'Data::Object::Array::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  my %seen;
  return [grep { not $seen{$_}++ } @$data];
}

sub mapping {
  return ('arg1');
}

1;
