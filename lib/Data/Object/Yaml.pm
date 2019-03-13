package Data::Object::Yaml;

use YAML::Tiny ();

use Data::Object::Class;

# BUILD
# METHODS

sub dump {
  my ($self, $data) = @_;

  my $space = $self->space;

  return $space->build($data)->write_string;
}

sub from {
  my ($self, $data) = @_;

  my $next = ref $data ? 'dump' : 'load';

  return $data ? $self->new->$next($data) : $self->new;
}

sub load {
  my ($self, $data) = @_;

  my $space = $self->space;

  return $space->build->read_string($data)->[-1];
}

sub read {
  my ($self, $file) = @_;

  return unless $file;

  my $data = $self->file($file)->slurp;

  return $self->load($data);
}

sub write {
  my ($self, $file, $data) = @_;

  return unless $file && $data;

  $data = $self->dump($data);
  $file = $self->file($file);

  $file->spew($data);

  return $data;
}

sub space {
  my ($self) = @_;

  require Data::Object::Space;

  return Data::Object::Space->new($self->origin);
}

sub file {
  my ($self, $file) = @_;

  require Data::Object::Path;

  return Data::Object::Path->new($file) if $file;

  return Data::Object::Path->new->tempfile(rand);
}

sub origin {
  return 'YAML::Tiny';
}

1;
