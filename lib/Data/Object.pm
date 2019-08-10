package Data::Object;

use 5.014;

use strict;
use warnings;

use Carp 'croak';

use parent 'Data::Object::Config';

# VERSION

# BUILD
# METHODS

sub new {
  my ($class, $data) = @_;

  unless (($data || '') =~ /[a-zA-Z]\w*/) {
    croak('Class name required');
  }

  require Data::Object::Space;

  return Data::Object::Space->new(join '::', __PACKAGE__, $data);
}

sub any {
  my ($class, $data) = @_;

  return $class->new('Any')->build($data);
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

sub integer {
  my ($class, $data) = @_;

  return $class->new('Integer')->build($data);
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
