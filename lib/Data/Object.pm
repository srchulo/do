package Data::Object;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Config';

# VERSION

# METHODS

sub new {
  my ($class, $name) = @_;

  die "Invalid argument" unless ("$name" || "") =~ /^[a-zA-Z]\w*/;

  require Data::Object::Space;

  return Data::Object::Space->new(join '::', __PACKAGE__, $name);
}

sub array {
  my ($class, $data) = @_;

  return $class->new('Array')->build($data);
}

sub code {
  my ($class, $data) = @_;

  return $class->new('Code')->build($data);
}

sub exception {
  my ($class, $data) = @_;

  return $class->new('Exception')->build($data);
}

sub float {
  my ($class, $data) = @_;

  return $class->new('Float')->build($data);
}

sub hash {
  my ($class, $data) = @_;

  return $class->new('Hash')->build($data);
}

sub number {
  my ($class, $data) = @_;

  return $class->new('Number')->build($data);
}

sub regexp {
  my ($class, $data) = @_;

  return $class->new('Regexp')->build($data);
}

sub scalar {
  my ($class, $data) = @_;

  return $class->new('Scalar')->build($data);
}

sub string {
  my ($class, $data) = @_;

  return $class->new('String')->build($data);
}

sub undef {
  my ($class, $data) = @_;

  return $class->new('Undef')->build($data);
}

1;
