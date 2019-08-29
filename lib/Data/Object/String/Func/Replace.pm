package Data::Object::String::Func::Replace;

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
  req => 1
);

has arg3 => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

has arg4 => (
  is => 'ro',
  isa => 'Str',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $search, $replace, $flags) = $self->unpack;

  my $result = "$data";
  my $regexp = UNIVERSAL::isa($search, 'Regexp');

  $flags = defined($flags) ? $flags : '';
  $search = quotemeta($search) if $search and !$regexp;

  local $@;
  eval("sub { \$_[0] =~ s/$search/$replace/$flags }")->($result);

  return $result;
}

sub mapping {
  return ('arg1', 'arg2', 'arg3', 'arg4');
}

1;
