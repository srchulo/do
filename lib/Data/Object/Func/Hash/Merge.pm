package Data::Object::Func::Hash::Merge;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has args => (
  is => 'ro',
  isa => 'ArrayRef[Any]',
  opt => 1
);

# METHODS

sub clone {
  require Storable;

  return Storable::dclone(pop);
}

sub execute {
  my ($self) = @_;

  my ($data, @args) = $self->unpack;

  if (!@args) {
    return $self->clone($data);
  }

  if (@args > 1) {
    return $self->clone($self->recurse($data, $self->recurse(@args)));
  }

  my ($right) = @args;
  my (%merge) = %$data;

  for my $key (keys %$right) {
    my $lprop = $$data{$key};
    my $rprop = $$right{$key};

    $merge{$key}
      = ((ref($rprop) eq 'HASH') and (ref($lprop) eq 'HASH'))
      ? $self->recurse($$data{$key}, $$right{$key})
      : $$right{$key};
  }

  return $self->clone(\%merge);
}

sub mapping {
  return ('arg1', '@args');
}

1;
