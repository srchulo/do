package Data::Object::Func::Hash::Grep;

use Data::Object Class;

extends 'Data::Object::Func::Hash';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Str | CodeRef',
  req => 1
);

has args => (
  is => 'ro',
  isa => 'ArrayRef[Any]',
  opt => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $code, @args) = $self->unpack;

  my @caught;

  for my $key (keys %$data) {
    my $value = $data->{$key};
    my $refs = {'$key' => \$key, '$value' => \$value};
    my $result = $self->codify($code, $refs)->($value, @args);
    push @caught, $key, $value if $result;
  }

  return {@caught};
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;
