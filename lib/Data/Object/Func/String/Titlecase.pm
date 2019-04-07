package Data::Object::Func::String::Titlecase;

use Data::Object 'Class';

extends 'Data::Object::Func::String';

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

  my $result = "$data";

  $result =~ s/\b(\w)/\U$1/g;

  return $result;
}

sub mapping {
  return ('arg1');
}

1;
