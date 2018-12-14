# ABSTRACT: Undef Object Role for Perl 5
package Data::Object::Role::Undef;

use strict;
use warnings;

use 5.014;

use Data::Object;
use Data::Object::Role;
use Data::Object::Library;
use Data::Object::Signatures;
use Scalar::Util;

map with($_), our @ROLES = qw(
    Data::Object::Role::Item
    Data::Object::Role::Value
);

# VERSION

method defined () {

    return 0;

}

method eq ($arg1) {

    return CORE::defined($arg1) ? 0 : 1;

}

method gt ($arg1) {

    return 0;

}

method ge ($arg1) {

    return eq($arg1) ? 1 : 0;

}

method lt ($arg1) {

    return 0;

}

method le ($arg1) {

    return eq($arg1) ? 1 : 0;

}

method ne ($arg1) {

    return CORE::defined($arg1) ? 1 : 0;

}

1;

=encoding utf8

=head1 SYNOPSIS

    use Data::Object::Class;

    with 'Data::Object::Role::Undef';

=cut

=head1 DESCRIPTION

Data::Object::Role::Undef provides functions  for operating on Perl 5 undefined
data.

=cut

=head1 ROLES

This package is comprised of the following roles.

=over 4

=item *

L<Data::Object::Role::Comparison>

=item *

L<Data::Object::Role::Defined>

=item *

L<Data::Object::Role::Detract>

=item *

L<Data::Object::Role::Dumper>

=item *

L<Data::Object::Role::Item>

=item *

L<Data::Object::Role::Output>

=item *

L<Data::Object::Role::Throwable>

=item *

L<Data::Object::Role::Type>

=item *

L<Data::Object::Role::Value>

=back

=cut

=method data

    # given $undef

    $undef->data; # original value

The data method returns the original and underlying value contained by the
object. This method is an alias to the detract method.

=cut

=method defined

    # given undef

    $undef->defined ? 'Yes' : 'No'; # No

The defined method always returns false. This method returns a
number object.

=cut

=method detract

    # given $undef

    $undef->detract; # original value

The detract method returns the original and underlying value contained by the
object.

=cut

=method dump

    # given $undef

    $undef->dump; # 'undef'

The dump method returns returns a string representation of the object.
This method returns a string value.

=cut

=method eq

    # given $undef

    $undef->eq; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method ge

    # given $undef

    $undef->ge; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method gt

    # given $undef

    $undef->gt; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method le

    # given $undef

    $undef->le; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method lt

    # given $undef

    $undef->lt; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method methods

    # given $undef

    $undef->methods;

The methods method returns the list of methods attached to object. This method
returns an array value.

=cut

=method ne

    # given $undef

    $undef->ne; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method new

    # given undef

    my $undef = Data::Object::Undef->new(undef);

The new method expects an undefined value and returns a new class instance.

=cut

=method print

    # given $undef

    $undef->print; # 'undef'

The print method outputs the value represented by the object to STDOUT and
returns true. This method returns a number value.

=cut

=method roles

    # given $undef

    $undef->roles;

The roles method returns the list of roles attached to object. This method
returns an array value.

=cut

=method say

    # given $undef

    $undef->say; # 'undef\n'

The say method outputs the value represented by the object appended with a
newline to STDOUT and returns true. This method returns a L<Data::Object::Number>
object.

=cut

=method throw

    # given $undef

    $undef->throw;

The throw method terminates the program using the core die keyword, passing the
object to the L<Data::Object::Exception> class as the named parameter C<object>.
If captured this method returns an exception value.

=cut

=method type

    # given $undef

    $undef->type; # UNDEF

The type method returns a string representing the internal data type object name.
This method returns a string value.

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

