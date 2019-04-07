package Data::Object::Type;

use strict;
use warnings;

use Type::Tiny;
use Type::Coercion;
use Types::TypeTiny;

use parent 'Data::Object::Kind';

# VERSION

# BUILD

sub new {
  return bless {}, shift;
}

# METHODS

sub name {
  die;
}

sub aliases {
  return [];
}

sub coercions {
  return [];
}

sub parent {
  return 'Object';
}

sub library {
  return shift->namespace->meta;
}

sub namespace {
  return 'Data::Object::Library';
}

sub register {
  my ($class) = @_;

  my $self = $class->new if !ref($class);

  $class->new->validator($_) for $self->name, @{$self->aliases};

  return $self;
}

sub validator {
  my ($self, $name) = @_;

  my $library = $self->library;

  if (!$name) {
    $name = $self->name;
  }
  if ($library->get_type($name)) {
    return $library->get_type($name);
  }

  my $type = Type::Tiny->new($self->options(name => $name));
  my $coercions = $self->coercions;

  for (my $i = 0; $i < @$coercions; $i+=2) {
    my $item = $coercions->[$i];

    $coercions->[$i] = $library->get_type($item) if !ref($item);
  }

  $type->coercion->add_type_coercions(@$coercions);

  return $library->add_type($type);
}

sub options {
  my ($self, %overrides) = @_;

  my %options;

  $options{name} = $overrides{name} || $self->name;
  $options{parent} = $overrides{parent} || $self->parent;

  if ($overrides{name}) {
    if ($overrides{name} ne $self->name) {
      $self->{alias} = $overrides{name};
    }
  }

  if (!ref($options{parent})) {
    $options{parent} = $self->library->get_type($options{parent});
  }

  my $constraint = sub { $self->validation(@_) };
  $options{constraint} = $overrides{constraint} || $constraint;

  if ($self->can('parameterize')) {
    my $generator = sub { $self->constraint_generator(@_) };
    $options{constraint_generator} = $generator;
  } elsif($overrides{constraint_generator}) {
    $options{constraint_generator} = $overrides{constraint_generator};
  }

  if ($self->can('parameterize_coercions')) {
    my $generator = sub { $self->coercion_generator(@_) };
    $options{coercion_generator} = $generator;
  }

  if ($self->can('explaination')) {
    my $generator = $self->explaination_generator;
    $options{deep_explanation} = $generator;
  } elsif($overrides{deep_explanation}) {
    $options{deep_explanation} = $overrides{deep_explanation};
  }

  return %options;
}

sub validation {
  die;
}

sub coercion_generator {
  my ($self, $type, $child, $data) = @_;

  if (!$data->has_coercion) {
    return $type->coercion;
  }

  my $anon = $data->coercion->_source_type_union;
  my $coercion = Type::Coercion->new(type_constraint => $child);
  my $generated = $self->parameterize_coercions($data, $type, $anon);

  for (my $i = 0; $i < @$generated; $i+=2) {
    my $item = $generated->[$i];

    $generated->[$i] = $self->library->get_type($item) if !ref($item);
  }

  $coercion->add_type_coercions(@$generated);

  return $coercion;
}

sub constraint_generator {
  my ($self, @args) = @_;

  return $self->validator if !@args;

  my $sign = "@{[$self->{alias} || $self->name]}\[`a\]";
  my $text = "Parameter to $sign expected to be a type constraint";
  my @list = map Types::TypeTiny::to_TypeTiny($_), @args;

  for my $item (@list) {
    if ($item->isa('Type::Tiny')) {
      next;
    }
    if (!Types::TypeTiny::TypeTiny->check($item)) {
      Types::Standard::_croak("$text; got $item");
    }
  }

  return sub { my ($data) = @_; $self->parameterize($data, @list) };
}

sub explaination_generator {
  my ($self, @args) = @_;

  # re-ordering arguments for consistency
  return sub { $self->explaination($_[1], $_[0], $_[2]) };
}

1;
