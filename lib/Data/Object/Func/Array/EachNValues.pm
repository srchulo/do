package Data::Object::Func::Array::EachNValues;

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
  isa => 'Num',
  req => 1
);

has arg3 => (
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

  my ($data, $number, $code, @args) = $self->unpack;

  my @list = (0 .. $#{$data});

  while (my @indexes = splice(@list, 0, $number)) {
    my @values;

    for (my $i = 0; $i < $number; $i++) {
      my $pos   = $i;
      my $index = $indexes[$pos];
      my $value = defined($index) ? $data->[$index] : undef;

      push @values, $value;
    }

    $code->(@values, @args);
  }

  return $data;
}

sub mapping {
  return ('arg1', 'arg2', 'arg3', '@args');
}

1;
