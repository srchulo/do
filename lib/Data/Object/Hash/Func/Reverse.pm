package Data::Object::Hash::Func::Reverse;

use Data::Object 'Class';

extends 'Data::Object::Hash::Func';

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

  my $retv = {};

  for (keys %$data) {
    if (defined($data->{$_})) {
      $retv->{$_} = $data->{$_};
    }
  }

  return {reverse %$retv};
}

sub mapping {
  return ('arg1');
}

1;
