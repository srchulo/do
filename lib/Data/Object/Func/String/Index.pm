package Data::Object::Func::String::Index;

use Data::Object 'Class';

extends 'Data::Object::Func::String';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

has arg3 => (
  is => 'ro',
  isa => 'Num',
  def => 0,
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $substr, $start) = $self->unpack;

  return index("$data", $substr) if not defined $start;
  return index("$data", $substr, $start);
}

sub mapping {
  return ('arg1', 'arg2', 'arg3');
}

1;
