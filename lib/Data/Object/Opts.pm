package Data::Object::Opts;

use 5.014;

use strict;
use warnings;

use Moo;

use Getopt::Long ();

with 'Data::Object::Role::Proxyable';
with 'Data::Object::Role::Stashable';

# VERSION

has args => (
  is => 'ro'
);

has spec => (
  is => 'ro'
);

has named => (
  is => 'ro'
);

# BUILD

sub BUILD {
  my ($self, $args) = @_;

  $self->{named} = {} if !$args->{named};

  $self->{args} = [] if !$args->{args};
  $self->{spec} = [] if !$args->{spec};

  $self->{args} = [@ARGV] if !@{$self->{args}};

  my $warn = [];

  local $SIG{__WARN__} = sub {
    push @$warn, [@_];

    return;
  };

  $self->stash(opts => $self->parse($args->{opts}));
  $self->stash(warn => $warn) if $warn;

  return $self;
}

sub BUILDPROXY {
  my ($class, $method, $self, $value) = @_;

  return if !$self;

  my $has_value = exists $_[3];

  return sub {
    return $self->get($method) if !$has_value; # no val

    return $self->set($method, $value);
  };
}

# METHODS

sub get {
  my ($self, $key) = @_;

  return if not defined $key;

  my $pos = $self->name($key);

  return if not defined $pos;

  return $self->stashed->{$pos};
}

sub set {
  my ($self, $key, $val) = @_;

  return if not defined $key;

  my $pos = $self->name($key);

  return if not defined $pos;

  return $self->stashed->{$pos} = $val;
}

sub exists {
  my ($self, $key) = @_;

  return if not defined $key;

  my $pos = $self->name($key);

  return if not defined $pos;

  return exists $self->stashed->{$pos};
}

sub name {
  my ($self, $key) = @_;

  if (defined $self->named->{$key}) {
    return $self->named->{$key};
  }

  if (defined $self->stashed->{$key}) {
    return $key;
  }

  return undef;
}

sub parse {
  my ($self, $extras) = @_;

  my $args = $self->args;
  my $spec = $self->spec;

  my $options = {};
  my @configs = qw(default no_auto_abbrev no_ignore_case);

  $extras = [] if !$extras;

  # configure parser
  Getopt::Long::Configure(Getopt::Long::Configure(@configs, @$extras));

  # parse args using spec
  Getopt::Long::GetOptionsFromArray([@$args], $options, @$spec);

  return $options;
}

sub stashed {
  my ($self) = @_;

  my $data = $self->stash('opts');

  return $data;
}

sub warned {
  my ($self) = @_;

  my $data = $self->stash('warn');

  return @$data;
}

sub warnings {
  my ($self) = @_;

  my $data = $self->stash('warn');

  return $data;
}

1;
