# ABSTRACT: Routine Signatures for Perl 5
package Data::Object::Config::Routine;

use 5.014;

use strict;
use warnings;

use Function::Parameters;

use Data::Object::Config qw(namespace reify);

# VERSION

sub import {
  return Function::Parameters->import(settings(@_));
}

sub settings {
  my ($class, @args) = @_;

  # reifier config
  my $caller = caller(1);
  my @config = ($class, sub { unshift @_, $caller; goto \&reify });

  # for backwards compat
  @args = grep !/^:/, @args;
  namespace($caller, pop(@args)) if @args;

  return { func_settings(@config), meth_settings(@config) };
}

sub func_settings {
  my ($class, $reifier) = @_;

  return (fun => {
    check_argument_count => 0, # for backwards compat :(
    check_argument_types => 1,
    default_arguments    => 1,
    defaults             => 'function',
    invocant             => 0,
    name                 => 'optional',
    named_parameters     => 1,
    reify_type           => $reifier,
    runtime              => 1,
    types                => 1,
  });
}

sub meth_settings {
  my ($class, $reifier) = @_;

  return (method => {
    attributes           => ':method',
    check_argument_count => 0, # for backwards compat :(
    check_argument_types => 1,
    default_arguments    => 1,
    defaults             => 'method',
    invocant             => 1,
    name                 => 'optional',
    named_parameters     => 1,
    reify_type           => $reifier,
    runtime              => 1,
    shift                => '$self',
    types                => 1,
  });
}

1;

=encoding utf8

=head1 SYNOPSIS

  use Data::Object::Config::Routine;

  method hello (Str $name) {

    say "Hello $name, how are you?";

  }

=cut

=head1 DESCRIPTION

Data::Object::Config::Routine is a subclass of L<Type::Tiny::Signatures> providing
method and function signatures supporting all the type constraints provided by
L<Data::Object::Config::Type>.

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
