package Data::Object::String::Func::Chomp;

use Data::Object 'Class';

extends 'Data::Object::String::Func';

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

  my $result = "$data";

  chomp($result);

  return $result;
}

sub mapping {
  return ('arg1');
}

1;
