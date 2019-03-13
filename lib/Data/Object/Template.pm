package Data::Object::Template;

use Template::Tiny ();

use Data::Object::Class;

with 'Data::Object::Role::Proxyable';

# BUILD

sub BUILD {
  my ($self, $args) = @_;

  my $origin = $self->origin;

  $self->{source} = $origin->new(TRIM => 1);

  return $self;
}

sub BUILDPROXY {
  my ($class, $method, @args) = @_;

  my $self = shift @args;
  my $source = $self->source;

  unless ($class->can($method) || $source->can($method)) {
    return;
  }
  return sub {
    my $return = $source->$method(@args);

    UNIVERSAL::isa($return, ref($source)) ? $class->new($return) : $return;
  };
}

# METHODS

sub origin {
  return 'Template::Tiny';
}

sub source {
  my ($self) = @_;

  return $self->{source};
}

sub render {
  my ($self, $template, $data) = @_;

  my $source = $self->source;

  my $content = '';

  $source->process(\$template, $data, \$content);

  return $content;
}

1;
