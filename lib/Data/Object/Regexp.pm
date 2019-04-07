package Data::Object::Regexp;

use Try::Tiny;

use Data::Object::Class;
use Data::Object::Export qw(
  cast
  croak
  load
);

map with($_), my @roles = qw(
  Data::Object::Role::Detract
  Data::Object::Role::Dumper
  Data::Object::Role::Output
  Data::Object::Role::Throwable
  Data::Object::Role::Type
);

map with($_), my @rules = qw(
  Data::Object::Rule::Defined
);

use overload (
  '""'     => 'data',
  '~~'     => 'data',
  fallback => 1
);

use parent 'Data::Object::Kind';

# VERSION

# BUILD

sub new {
  my ($class, $arg) = @_;

  my $role = 'Data::Object::Role::Type';

  if (Scalar::Util::blessed($arg)) {
    $arg = $arg->data if $arg->can('does') && $arg->does($role);
  }

  if (!defined($arg) || !re::is_regexp($arg)) {
    croak('Instantiation Error: Not a RegexpRef');
  }

  return bless \$arg, $class;
}

# METHODS

sub roles {
  return cast([@roles]);
}

sub rules {
  return cast([@rules]);
}

# DISPATCHERS

sub defined {
  my ($self, @args) = @_;

  try {
    my $func = $self->_funcs('defined');

    return cast($func->build($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

# METHODS

sub search {
  my ($self, @args) = @_;

  try {
    my $func = $self->_funcs('search');

    return $func->build($self, @args)->execute;
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub replace {
  my ($self, @args) = @_;

  try {
    my $func = $self->_funcs('replace');

    return $func->build($self, @args)->execute;
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub _funcs {
  my ($self, $name) = @_;

  return if !$name;

  my $space = $self->space;

  return $space->parent->child('func', $space->base, $name);
}

1;
