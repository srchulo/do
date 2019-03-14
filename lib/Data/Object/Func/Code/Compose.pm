package Data::Object::Func::Code::Compose;

use Data::Object Class;

extends 'Data::Object::Func::Code';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'CodeLike',
  req => 1
);

has args => (
  is => 'ro',
  isa => 'ArrayRef[Any]',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $code, @args) = $self->unpack;

  my $refs = {'$code' => \$code};

  $code = $self->codify($code, $refs);

  return sub { (sub { $code->($data->(@_)) })->(@args, @_) };
}

sub mapping {
  return ('arg1', 'arg2', '@args');
}

1;