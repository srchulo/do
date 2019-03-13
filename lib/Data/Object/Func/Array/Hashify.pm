package Data::Object::Func::Array::Hashify;

use Data::Object Class;

extends 'Data::Object::Func::Array';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Undef | Str | CodeRef',
  opt => 1
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

  my $hash = {};

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value};

    if (defined($value)) {
      my $result = $self->codify($code, $refs)->($value, @args);
      $hash->{$value} = $result if defined($result);
    }
  }

  return $hash;
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;
