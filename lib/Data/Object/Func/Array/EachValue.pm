package Data::Object::Func::Array::EachValue;

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

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $refs = {'$index' => \$index, '$value' => \$value,};

    $self->codify($code, $refs)->($value, @args);
  }

  return $data;
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;
