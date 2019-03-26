package Data::Object::Func::Hash::Lookup;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $path) = $self->unpack;

  return undef
    unless ($data and $path)
    and (('HASH' eq ref($data))
    or Scalar::Util::blessed($data) and $data->isa('HASH'));

  return $data->{$path} if $data->{$path};

  my $next;
  my $rest;

  ($next, $rest) = $path =~ /(.*)\.([^\.]+)$/;

  if ($next and $data->{$next}) {
    return $self->new($data->{$next}, $rest)->execute;
  }

  ($next, $rest) = $path =~ /([^\.]+)\.(.*)$/;

  if ($next and $data->{$next}) {
    return $self->new($data->{$next}, $rest)->execute;
  }

  return undef;
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
