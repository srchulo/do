package Data::Object::Func::String::Contains;

use Data::Object 'Class';

extends 'Data::Object::Func::String';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Str | RegexpRef',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $pattern) = $self->unpack;

  return 0 unless defined($pattern);

  my $regexp = UNIVERSAL::isa($pattern, 'Regexp');

  return index("$data", $pattern) < 0 ? 0 : 1 if !$regexp;

  return ("$data" =~ $pattern) ? 1 : 0;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
