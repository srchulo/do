package Data::Object::Path;

use Path::Tiny ();

use Data::Object::Class;

with 'Data::Object::Role::Proxyable';

use overload (
  '""'     => 'string',
  '~~'     => 'string',
  fallback => 1
);

# BUILD

sub BUILD {
  my ($self, $args) = @_;

  my $origin = $self->origin;

  $self->{source} = $origin->new($args->{source});

  return $self;
}

sub BUILDARGS {
  my ($self, @args) = @_;

  unshift @args, 'source', @args ? () : '.' if @args < 2;

  return {@args};
}

sub BUILDPROXY {
  my ($class, $method, @args) = @_;

  my $self = shift @args;
  my $source = $self->source;

  unless ($class->can($method) || $source->can($method)) {
    return;
  }
  return sub {
    # force-handle wantarray :(
    my @results = $source->$method(@args);

    if (@results > 1) {
      return (@results);
    } elsif (ref($results[0])) {
      my $result = $results[0];
      return UNIVERSAL::isa($result, ref($source)) ? $class->new($result) : $result;
    } else {
      return $results[0];
    }
  };
}

# METHODS

sub origin {
  return 'Path::Tiny';
}

sub source {
  my ($self) = @_;

  return $self->{source};
}

sub string {
  my ($self) = @_;

  my $source = $self->source;

  return $source->stringify;
}

1;
