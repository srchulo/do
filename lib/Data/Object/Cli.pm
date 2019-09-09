package Data::Object::Cli;

use 5.014;

use strict;
use warnings;

use Moo;

use Data::Object::Args;
use Data::Object::Data;
use Data::Object::Opts;
use Data::Object::Vars;

# VERSION

has args => (
  is => 'ro',
  builder => 'BUILD_ARGS',
  lazy => 1
);

has data => (
  is => 'ro',
  builder => 'BUILD_DATA',
  lazy => 1
);

has opts => (
  is => 'ro',
  builder => 'BUILD_OPTS',
  lazy => 1
);

has vars => (
  is => 'ro',
  builder => 'BUILD_VARS',
  lazy => 1
);

# BUILD

sub BUILD {
  my ($self, $args) = @_;

  return $self; # noop
}

sub BUILD_ARGS {
  my ($self) = @_;

  my $sign = $self->sign;

  return Data::Object::Args->new(named => $sign);
}

sub BUILD_DATA {
  my ($self) = @_;

  return Data::Object::Data->new(from => ref $self);
}

sub BUILD_OPTS {
  my ($self) = @_;

  my $spec = $self->spec;

  $self->{opts} = Data::Object::Opts->new(spec => $spec);
}

sub BUILD_VARS {
  my ($self) = @_;

  return Data::Object::Vars->new;
}

# METHODS

sub main {
  shift
}

sub help {
  my ($self) = @_;

  my $data = $self->data;
  my $help = $data->content('help');

  return $help;
}

sub okay {
  my ($self, $handler, @args) = @_;

  return $self->exit(0, $handler, @args);
}

sub fail {
  my ($self, $handler, @args) = @_;

  return $self->exit(1, $handler, @args);
}

sub exit {
  my ($self, $code, $handler, @args) = @_;

  $self->handle($handler, @args) if $handler;

  exit $code;
}

sub run {
  my ($class, @args) = @_;

  unless (caller(1)) {
    my $self = $class->new(@args);

    return $self->handle('main');
  }

  return time;
}

sub handle {
  my ($self, $method, %args) = @_;

  my %meta;

  $meta{args} = $self->args;
  $meta{data} = $self->data;
  $meta{opts} = $self->opts;
  $meta{vars} = $self->vars;

  return $self->$method(%meta, %args);
}

sub spec {
  my ($self) = @_;

  my $data = $self->data;
  my $spec = $data->content('spec');

  return [] if !$spec || !@$spec;

  return [split /,\s*/, join ', ', @$spec];
}

sub sign {
  my ($self) = @_;

  my $data = $self->data;
  my $sign = $data->content('sign');

  return {} if !$sign || !@$sign;

  my $indx = 0;
  my $regx = qr/\{(\w+)\}/;

  return {map +($_, $indx++), join('', @$sign) =~ m/$regx/g};
}

1;
