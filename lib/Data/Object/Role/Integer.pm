# ABSTRACT: Integer Object Role for Perl 5
package Data::Object::Role::Integer;

use 5.014;

use strict;
use warnings;

use Data::Object::Role;

use Data::Object '$dispatch';

our @ROLES = map with($_), qw(
  Data::Object::Role::Item
  Data::Object::Role::Numeric
  Data::Object::Role::Value
);

my $data = &$dispatch('Data::Object');
my $func = &$dispatch('Data::Object::Export::Integer');

# VERSION

sub defined {
  return &$data('cast', &$func('defined', @_));
}

1;

=encoding utf8

=head1 SYNOPSIS

  use Data::Object::Class;

  with 'Data::Object::Role::Integer';

=cut

=head1 DESCRIPTION

Data::Object::Role::Integer provides routines for operating on Perl 5 integer
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

L<Data::Object::Role::Numeric>

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

  # given $integer

  $integer->data; # original value

The data method returns the original and underlying value contained by the
object. This method is an alias to the detract method.

=cut

=method defined

  # given $integer

  $integer->defined; # 1

The defined method returns true if the object represents a value that meets the
criteria for being defined, otherwise it returns false. This method returns a
number object.

=cut

=method detract

  # given $integer

  $integer->detract; # original value

The detract method returns the original and underlying value contained by the
object.

=cut

=method downto

  # given 1

  $integer->downto(0); # [1,0]

The downto method returns an array reference containing integer decreasing
values down to and including the limit. This method returns a
array object.

=cut

=method dump

  # given 1

  $integer->dump; # '1'

The dump method returns returns a string representation of the object.
This method returns a string value.

=cut

=method eq

  # given 1

  $integer->eq(1); # 1

The eq method performs a numeric equality operation. This method returns a
number object representing a boolean.

=cut

=method ge

  # given 1

  $integer->ge(0); # 1

The ge method returns true if the argument provided is greater-than or equal-to
the value represented by the object. This method returns a Data::Object::Number
object.

=cut

=method gt

  # given 1

  $integer->gt(1); # 0

The gt method performs a numeric greater-than comparison. This method returns a
number object representing a boolean.

=cut

=method le

  # given 0

  $integer->le(1); # 1

The le method returns true if the argument provided is less-than or equal-to
the value represented by the object. This method returns a Data::Object::Number
object.

=cut

=method lt

  # given 1

  $integer->lt(1); # 0

The lt method performs a numeric less-than comparison. This method returns a
number object representing a boolean.

=cut

=method methods

  # given $integer

  $integer->methods;

The methods method returns the list of methods attached to object. This method
returns an array value.

=cut

=method ne

  # given 1

  $integer->ne(0); # 1

The ne method performs a numeric equality operation. This method returns a
number object representing a boolean.

=cut

=method new

  # given 9

  my $integer = Data::Object::Integer->new(9);

The new method expects a number and returns a new class instance.

=cut

=method print

  # given 0

  $integer->print; # '0'

The print method outputs the value represented by the object to STDOUT and
returns true. This method returns a number value.

=cut

=method roles

  # given $integer

  $integer->roles;

The roles method returns the list of roles attached to object. This method
returns an array value.

=cut

=method say

  # given 0

  $integer->say; # '0\n'

The say method outputs the value represented by the object appended with a
newline to STDOUT and returns true. This method returns a L<Data::Object::Number>
object.

=cut

=method throw

  # given $integer

  $integer->throw;

The throw method terminates the program using the core die keyword, passing the
object to the L<Data::Object::Exception> class as the named parameter C<object>.
If captured this method returns an exception value.

=cut

=method to

  # given 1

  $integer->to(2); # [1,2]
  $integer->to(0); # [1,0]

The to method returns an array reference containing integer increasing or
decreasing values to and including the limit in ascending or descending order
based on the value of the floating-point object. This method returns a
array object.

=cut

=method type

  # given $integer

  $integer->type; # INTEGER

The type method returns a string representing the internal data type object name.
This method returns a string value.

=cut

=method upto

  # given 1

  $integer->upto(2); # [1,2]

The upto method returns an array reference containing integer increasing
values up to and including the limit. This method returns a
array object.

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
