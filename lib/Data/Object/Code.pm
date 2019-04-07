package Data::Object::Code;

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
  Data::Object::Role::Throwable
  Data::Object::Role::Type
);

map with($_), my @rules = qw(
  Data::Object::Rule::Defined
);

use overload (
  '""'     => 'data',
  '~~'     => 'data',
  '&{}'    => 'self',
  fallback => 1
);

use parent 'Data::Object::Kind';

# BUILD

sub new {
  my ($class, $arg) = @_;

  my $role = 'Data::Object::Role::Type';

  if (Scalar::Util::blessed($arg)) {
    $arg = $arg->data if $arg->can('does') && $arg->does($role);
  }

  unless (ref($arg) eq 'CODE') {
    croak('Instantiation Error: Not a CodeRef');
  }

  return bless $arg, $class;
}

# METHODS

sub self {
  return shift;
}

sub roles {
  return cast([@roles]);
}

sub rules {
  return cast([@rules]);
}

# DISPATCHERS

sub call {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Code::Call';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub compose {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Code::Compose';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub conjoin {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Code::Conjoin';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub curry {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Code::Curry';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub defined {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Code::Defined';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub disjoin {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Code::Disjoin';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub next {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Code::Next';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub rcurry {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Code::Rcurry';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

1;
