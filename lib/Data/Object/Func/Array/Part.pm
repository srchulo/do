package Data::Object::Func::Array::Part;

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
  isa => 'CodeRef',
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

  my $retv = [[], []];

  for (my $i = 0; $i < @$data; $i++) {
    my $index = $i;
    my $value = $data->[$i];
    my $result = $code->($value, @args);
    my $slot = $result ? $$retv[0] : $$retv[1];
    push @$slot, $value;
  }

  return $retv;
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;
