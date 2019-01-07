# ABSTRACT: Development Environment for Perl 5
package do;

use 5.014;

use strict;
use warnings;

use Import::Into;

use Data::Object::Export ':all';

# VERSION

sub import {
  my ($class, $type) = @_;

  my $target = caller;

  # basics
  import_into($target, 'strict');
  import_into($target, 'warnings');
  import_into($target, 'feature', 'say');

  # signatures (types and libraries)
  import_into($target, 'Data::Object::Library');
  import_into($target, 'Data::Object::Signatures');

  if ($type and ($type eq '-ex' || $type eq '-core')) {
    import_core_config($target);
  }

  if ($type and ($type eq '-ec' || $type eq '-class')) {
    import_class_config($target);
  }

  if ($type and ($type eq '-er' || $type eq '-role')) {
    import_role_config($target);
  }

  if ($type and ($type eq '-es' || $type eq '-script')) {
    import_script_config($target);
  }

  return;
}

sub import_into {
  my ($target, $import, @args) = @_;

  import::into($import, $target, @args);

  return;
}

sub import_core_config {
  my ($target) = @_;

  import_into($target, 'Data::Object::Export::Core');

  return;
}

sub import_class_config {
  my ($target) = @_;

  return;
}

sub import_role_config {
  my ($target) = @_;

  return;
}

sub import_script_config {
  my ($target) = @_;

  import_into($target, 'Data::Object::Export::Script');

  return;
}

1;

=encoding utf8

=head1 SYNOPSIS

  use do;

is equivalent to

  use 5.014;

  use strict;
  use warnings;
  use feature 'say';

  use Data::Object::Library;
  use Data::Object::Signatures;

=head1 DESCRIPTION

Data::Object is a framework for writing structured and highly object-oriented
Perl 5 software programs. Additionally, this distribution provides classes
which wrap Perl 5 native data types and provides methods for operating on the
data.

=cut

=head1 SEE ALSO

=over 4

=item *

L<Data::Object::Array>

=item *

L<Data::Object::Class>

=item *

L<Data::Object::Class::Syntax>

=item *

L<Data::Object::Code>

=item *

L<Data::Object::Float>

=item *

L<Data::Object::Hash>

=item *

L<Data::Object::Integer>

=item *

L<Data::Object::Number>

=item *

L<Data::Object::Role>

=item *

L<Data::Object::Role::Syntax>

=item *

L<Data::Object::Regexp>

=item *

L<Data::Object::Scalar>

=item *

L<Data::Object::String>

=item *

L<Data::Object::Undef>

=item *

L<Data::Object::Universal>

=item *

L<Data::Object::Autobox>

=item *

L<Data::Object::Immutable>

=item *

L<Data::Object::Library>

=item *

L<Data::Object::Prototype>

=item *

L<Data::Object::Signatures>

=back

=cut
