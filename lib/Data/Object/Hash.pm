package Data::Object::Hash;

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
  Data::Object::Rule::Collection
  Data::Object::Rule::Comparison
  Data::Object::Rule::Defined
  Data::Object::Rule::List
);

use overload (
  '""'     => 'data',
  '~~'     => 'data',
  '%{}'    => 'self',
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

  unless (ref($arg) eq 'HASH') {
    croak('Instantiation Error: Not a HashRef');
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

sub clear {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Clear';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub count {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Count';

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
    my $func = 'Data::Object::Func::Hash::Defined';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub delete {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Delete';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub each {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Each';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub each_key {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::EachKey';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub each_n_values {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::EachNValues';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub each_value {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::EachValue';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub empty {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Empty';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub eq {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Eq';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub exists {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Exists';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub filter_exclude {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::FilterExclude';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub filter_include {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::FilterInclude';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub fold {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Fold';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub ge {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Ge';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub get {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Get';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub grep {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Grep';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub gt {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Gt';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub head {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Head';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub invert {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Invert';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub iterator {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Iterator';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub join {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Join';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub keys {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Keys';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub le {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Le';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub length {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Length';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub list {
  my ($self) = @_;

  my @retv = (map cast($_), %$self);

  return wantarray ? (@retv) : cast([@retv]);
}

sub lookup {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Lookup';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub lt {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Lt';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub map {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Map';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub merge {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Merge';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub ne {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Ne';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub pairs {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Pairs';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub reset {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Reset';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub reverse {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Reverse';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub set {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Set';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub slice {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Slice';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub sort {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Sort';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub tail {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Tail';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub unfold {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Unfold';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

sub values {
  my ($self, @args) = @_;

  try {
    my $func = 'Data::Object::Func::Hash::Values';

    return cast(load($func)->new($self, @args)->execute);
  }
  catch {
    my $error = $_;

    $self->throw(ref($error) ? $error->message : "$error");
  };
}

1;
