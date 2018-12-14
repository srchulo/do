# ABSTRACT: Code Object Role for Perl 5
package Data::Object::Role::Code;

use strict;
use warnings;

use 5.014;

use Data::Object;
use Data::Object::Role;
use Data::Object::Library;
use Data::Object::Signatures;
use Scalar::Util;

map with($_), our @ROLES = qw(
    Data::Object::Role::Dumper
    Data::Object::Role::Item
);

# VERSION

method call (@args) {

    return $self->(@args);

}

method compose ($code, @args) {

    my $refs = { '$code' => \$code };

    $code = Data::Object::codify($code, $refs);

    return curry(sub { $code->($self->(@_)) }, @args);

}

method conjoin ($code) {

    my $refs = { '$code' => \$code };

    $code = Data::Object::codify($code, $refs);

    return sub { $self->(@_) && $code->(@_) };

}

method curry (@args) {

    return sub { $self->(@args, @_) };

}

method defined () {

    return 1;

}

method disjoin ($code) {

    my $refs = { '$code' => \$code };

    $code = Data::Object::codify($code);

    return sub { $self->(@_) || $code->(@_) };

}

method next (@args) {

    return $self->call(@args);

}

method rcurry (@args) {

    return sub { $self->(@_, @args) };

}

1;

=encoding utf8

=head1 SYNOPSIS

    use Data::Object::Class;

    with 'Data::Object::Role::Code';

=cut

=head1 DESCRIPTION

Data::Object::Role::Code provides routines for operating on Perl 5 code
references.

=cut

=head1 CODIFICATION

Certain methods provided by the this module support codification, a process
which converts a string argument into a code reference which can be used to
supply a callback to the method called. A codified string can access its
arguments by using variable names which correspond to letters in the alphabet
which represent the position in the argument list. For example:

    $code->example('$a + $b * $c', 100);

    # if the example method does not supply any arguments automatically then
    # the variable $a would be assigned the user-supplied value of 100,
    # however, if the example method supplies two arguments automatically then
    # those arugments would be assigned to the variables $a and $b whereas $c
    # would be assigned the user-supplied value of 100

    # e.g.

    $code->conjoin('$code->(123)');

    # etc

Any place a codified string is accepted, a coderef or L<Data::Object::Code>
object is also valid. Arguments are passed through the usual C<@_> list.

=cut

=head1 ROLES

This package is comprised of the following roles.

=over 4

=item *

L<Data::Object::Role::Defined>

=item *

L<Data::Object::Role::Detract>

=item *

L<Data::Object::Role::Dumper>

=item *

L<Data::Object::Role::Item>

=item *

L<Data::Object::Role::Throwable>

=item *

L<Data::Object::Role::Type>

=back

=cut

=method call

    # given sub { (shift // 0) + 1 }

    $code->call; # 1
    $code->call(0); # 1
    $code->call(1); # 2
    $code->call(2); # 3

The call method executes and returns the result of the code. This method returns
a data type object to be determined after execution.

=cut

=method compose

    # given sub { [@_] }

    $code = $code->compose($code, 1,2,3);
    $code->(4,5,6); # [[1,2,3,4,5,6]]

    # this can be confusing, here's what's really happening:
    my $listing = sub {[@_]}; # produces an arrayref of args
    $listing->($listing->(@args)); # produces a listing within a listing
    [[@args]] # the result

The compose method creates a code reference which executes the first argument
(another code reference) using the result from executing the code as it's
argument, and returns a code reference which executes the created code reference
passing it the remaining arguments when executed. This method returns a
code object.

=cut

=method conjoin

    # given sub { $_[0] % 2 }

    $code = $code->conjoin(sub { 1 });
    $code->(0); # 0
    $code->(1); # 1
    $code->(2); # 0
    $code->(3); # 1
    $code->(4); # 0

The conjoin method creates a code reference which execute the code and the
argument in a logical AND operation having the code as the lvalue and the
argument as the rvalue. This method returns a code value.

=cut

=method curry

    # given sub { [@_] }

    $code = $code->curry(1,2,3);
    $code->(4,5,6); # [1,2,3,4,5,6]

The curry method returns a code reference which executes the code passing it
the arguments and any additional parameters when executed. This method returns a
code object.

=cut

=method data

    # given $code

    $code->data; # original value

The data method returns the original and underlying value contained by the
object. This method is an alias to the detract method.

=cut

=method defined

    # given $code

    $code->defined; # 1

The defined method returns true if the object represents a value that meets the
criteria for being defined, otherwise it returns false. This method returns a
number object.

=cut

=method detract

    # given $code

    $code->detract; # original value

The detract method returns the original and underlying value contained by the
object.

=cut

=method disjoin

    # given sub { $_[0] % 2 }

    $code = $code->disjoin(sub { -1 });
    $code->(0); # -1
    $code->(1); #  1
    $code->(2); # -1
    $code->(3); #  1
    $code->(4); # -1

The disjoin method creates a code reference which execute the code and the
argument in a logical OR operation having the code as the lvalue and the
argument as the rvalue. This method returns a code value.

=cut

=method dump

    # given $code

    $code->dump; # sub { package Data::Object; goto \\&{\$data}; }

The dump method returns returns a string representation of the object.
This method returns a string value.

=cut

=method methods

    # given $code

    $code->methods;

The methods method returns the list of methods attached to object. This method
returns an array value.

=cut

=method new

    # given sub { shift + 1 }

    my $code = Data::Object::Code->new(sub { shift + 1 });

The new method expects a code reference and returns a new class instance.

=cut

=method next

    $code->next;

The next method is an alias to the call method. The naming is especially useful
(i.e. helps with readability) when used with closure-based iterators. This
method returns a code value. This method is an alias to the
call method.

=cut

=method rcurry

    # given sub { [@_] }

    $code = $code->rcurry(1,2,3);
    $code->(4,5,6); # [4,5,6,1,2,3]

The rcurry method returns a code reference which executes the code passing it
the any additional parameters and any arguments when executed. This method
returns a code value.

=cut

=method roles

    # given $code

    $code->roles;

The roles method returns the list of roles attached to object. This method
returns an array value.

=cut

=method throw

    # given $code

    $code->throw;

The throw method terminates the program using the core die keyword, passing the
object to the L<Data::Object::Exception> class as the named parameter C<object>.
If captured this method returns an exception value.

=cut

=method type

    # given $code

    $code->type; # CODE

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

