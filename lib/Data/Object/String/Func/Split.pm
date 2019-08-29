package Data::Object::String::Func::Split;

use Data::Object 'Class';

extends 'Data::Object::String::Func';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'RegexpRef | Str',
  def => sub { qr() },
  opt => 1
);

has arg3 => (
  is => 'ro',
  isa => 'Num',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $pattern, $limit) = $self->unpack;

  my $regexp = UNIVERSAL::isa($pattern, 'Regexp');

  $pattern = quotemeta($pattern) if $pattern and !$regexp;

  return [split(/$pattern/, "$data")] if !defined($limit);
  return [split(/$pattern/, "$data", $limit)];
}

sub mapping {
  return ('arg1', 'arg2', 'arg3');
}

1;
