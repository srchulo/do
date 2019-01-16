# ABSTRACT: Singleton Object for Perl 5
package Data::Object::Singleton;

use 5.014;

use strict;
use warnings;

use parent 'Data::Object::Class';

# VERSION

sub import {
  my ($class, @args) = @_;

  my $target = caller;

  eval "package $target; use Data::Object::Class; 1;";

  no strict 'refs';

  *{"${target}::BUILD"} = $class->can('BUILD');
  *{"${target}::RENEW"} = $class->can('RENEW');

  return;
}

sub BUILD {
  my ($self, $args) = @_;

  my $class = ref($self) || $self;

  no strict 'refs';

  ${"${class}::data"} = {%$self, %$args} if !${"${class}::data"};

  $_[0] = bless ${"${class}::data"}, $class;

  return $class;
}

sub RENEW {
  my ($self, @args) = @_;

  my $class = ref($self) || $self;

  no strict 'refs';

  undef ${"${class}::data"};

  return $class->new(@args);
}

1;

=encoding utf8

=head1 SYNOPSIS

  package Registry;

  use Data::Object::Singleton;

  extends 'Environment';

  1;

=cut

=head1 DESCRIPTION

Data::Object::Singleton inherits all methods and behaviour from L<Moo>.
Please see that documentation for more usage information. Additionally, see
L<Data::Object::Class::Syntax> which provides a DSL that makes declaring
classes easier and more fun.

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

L<Data::Object::Any>

=item *

L<Data::Object::Autobox>

=item *

L<Data::Object::Immutable>

=item *

L<Data::Object::Config::Type>

=item *

L<Data::Object::Prototype>

=item *

L<Data::Object::Config::Routine>

=back

=cut
