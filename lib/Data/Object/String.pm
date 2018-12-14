# ABSTRACT: String Object for Perl 5
package Data::Object::String;

use strict;
use warnings;

use 5.014;

use Data::Object;
use Data::Object::Class;
use Data::Object::Library;
use Data::Object::Signatures;
use Scalar::Util;

with 'Data::Object::Role::String';

# VERSION

method new ($class: @args) {

  my $arg  = $args[0];
  my $role = 'Data::Object::Role::Type';

  $arg = $arg->data
    if Scalar::Util::blessed($arg)
    and $arg->can('does')
    and $arg->does($role);

  Data::Object::throw('Type Instantiation Error: Not a String')
    unless defined($arg) && not ref($arg);

  return bless \$arg, $class;

}

our @METHODS = @{__PACKAGE__->methods};

my $exclude = qr/^data|detract|new$/;

around [grep { !/$exclude/ } @METHODS] => fun($orig, $self, @args) {

  my $results = $self->$orig(@args);

  return Data::Object::deduce_deep($results);

};

1;

=encoding utf8

=head1 SYNOPSIS

  use Data::Object::String;

  my $string = Data::Object::String->new('abcedfghi');

=cut

=head1 DESCRIPTION

Data::Object::String provides routines for operating on Perl 5 string
data. String methods work on data that meets the criteria for being a string. A
string holds and manipulates an arbitrary sequence of bytes, typically
representing characters. Users of strings should be aware of the methods that
modify the string itself as opposed to returning a new string. Unless stated, it
may be safe to assume that the following methods copy, modify and return new
strings based on their function.

=cut

=head1 COMPOSITION

This package inherits all functionality from the L<Data::Object::Role::String>
role and implements proxy methods as documented herewith.

=cut

=head1 ROLES

This package is comprised of the following roles.

=over 4

=item *

L<Data::Object::Role::Alphabetic>

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

=method append

  # given 'firstname'

  $string->append('lastname'); # firstname lastname

The append method modifies and returns the string with the argument list
appended to it separated using spaces. This method returns a
L<Data::Object::String> object.

=cut

=method camelcase

  # given 'hello world'

  $string->camelcase; # HelloWorld

The camelcase method modifies the string such that it will no longer have any
non-alphanumeric characters and each word (group of alphanumeric characters
separated by 1 or more non-alphanumeric characters) is capitalized. Note, this
method modifies the string. This method returns a L<Data::Object::String>
object.

=cut

=method chomp

  # given "name, age, dob, email\n"

  $string->chomp; # name, age, dob, email

The chomp method is a safer version of the chop method, it's used to remove the
newline (or the current value of $/) from the end of the string. Note, this
method modifies and returns the string. This method returns a
L<Data::Object::String> object.

=cut

=method chop

  # given "this is just a test."

  $string->chop; # this is just a test

The chop method removes the last character of a string and returns the character
chopped. It is much more efficient than "s/.$//s" because it neither scans nor
copies the string. Note, this method modifies and returns the string. This
method returns a L<Data::Object::String> object.

=cut

=method concat

  # given 'ABC'

  $string->concat('DEF', 'GHI'); # ABCDEFGHI

The concat method modifies and returns the string with the argument list
appended to it. This method returns a L<Data::Object::String> object.

=cut

=method contains

  # given 'Nullam ultrices placerat nibh vel malesuada.'

  $string->contains('trices'); # 1; true
  $string->contains('itrices'); # 0; false

  $string->contains(qr/trices/); # 1; true
  $string->contains(qr/itrices/); # 0; false

The contains method searches the string for the string specified in the
argument and returns true if found, otherwise returns false. If the argument is
a string, the search will be performed using the core index function. If the
argument is a regular expression reference, the search will be performed using
the regular expression engine. This method returns a L<Data::Object::Number>
object.

=cut

=method data

  # given $string

  $string->data; # original value

The data method returns the original and underlying value contained by the
object. This method is an alias to the detract method.

=cut

=method defined

  # given $string

  $string->defined; # 1

The defined method returns true if the object represents a value that meets the
criteria for being defined, otherwise it returns false. This method returns a
L<Data::Object::Number> object.

=cut

=method detract

  # given $string

  $string->detract; # original value

The detract method returns the original and underlying value contained by the
object.

=cut

=method dump

  # given 'exciting'

  $string->dump; # 'exciting'

The dump method returns returns a string representation of the object.
This method returns a L<Data::Object::String> object.

=cut

=method eq

  # given 'exciting'

  $string->eq('Exciting'); # 0

The eq method returns true if the argument provided is equal to the value
represented by the object. This method returns a L<Data::Object::Number> object.

=cut

=method ge

  # given 'exciting'

  $string->ge('Exciting'); # 1

The ge method returns true if the argument provided is greater-than or equal-to
the value represented by the object. This method returns a Data::Object::Number
object.

=cut

=method gt

  # given 'exciting'

  $string->gt('Exciting'); # 1

The gt method returns true if the argument provided is greater-than the value
represented by the object. This method returns a L<Data::Object::Number> object.

=cut

=method hex

  # given '0xaf'

  string->hex; # 175

The hex method returns the value resulting from interpreting the string as a
hex string. This method returns a data type object to be determined after
execution.

=cut

=method index

  # given 'unexplainable'

  $string->index('explain'); # 2
  $string->index('explain', 0); # 2
  $string->index('explain', 1); # 2
  $string->index('explain', 2); # 2
  $string->index('explain', 3); # -1
  $string->index('explained'); # -1

The index method searches for the argument within the string and returns the
position of the first occurrence of the argument. This method optionally takes a
second argument which would be the position within the string to start
searching from (also known as the base). By default, starts searching from the
beginning of the string. This method returns a data type object to be determined
after execution.

=cut

=method lc

  # given 'EXCITING'

  $string->lc; # exciting

The lc method returns a lowercased version of the string. This method returns a
L<Data::Object::String> object. This method is an alias to the lowercase method.

=cut

=method lcfirst

  # given 'EXCITING'

  $string->lcfirst; # eXCITING

The lcfirst method returns a the string with the first character lowercased.
This method returns a L<Data::Object::String> object.

=cut

=method le

  # given 'exciting'

  $string->le('Exciting'); # 0

The le method returns true if the argument provided is less-than or equal-to
the value represented by the object. This method returns a Data::Object::Number
object.

=cut

=method length

  # given 'longggggg'

  $string->length; # 9

The length method returns the number of characters within the string. This
method returns a L<Data::Object::Number> object.

=cut

=method lines

  # given "who am i?\nwhere am i?\nhow did I get here"

  $string->lines; # ['who am i?','where am i?','how did i get here']

The lines method breaks the string into pieces, split on 1 or more newline
characters, and returns an array reference consisting of the pieces. This method
returns a L<Data::Object::Array> object.

=cut

=method lowercase

  # given 'EXCITING'

  $string->lowercase; # exciting

The lowercase method is an alias to the lc method. This method returns a
L<Data::Object::String> object.

=cut

=method lt

  # given 'exciting'

  $string->lt('Exciting'); # 0

The lt method returns true if the argument provided is less-than the value
represented by the object. This method returns a L<Data::Object::Number> object.

=cut

=method methods

  # given $string

  $string->methods;

The methods method returns the list of methods attached to object. This method
returns a L<Data::Object::Array> object.

=cut

=method ne

  # given 'exciting'

  $string->ne('Exciting'); # 1

The ne method returns true if the argument provided is not equal to the value
represented by the object. This method returns a L<Data::Object::Number> object.

=cut

=method new

  # given abcedfghi

  my $string = Data::Object::String->new('abcedfghi');

The new method expects a string and returns a new class instance.

=cut

=method print

  # given 'exciting'

  $string->print; # 'exciting'

The print method outputs the value represented by the object to STDOUT and
returns true. This method returns a L<Data::Object::Number> object.

=cut

=method replace

  # given 'Hello World'

  $string->replace('World', 'Universe'); # Hello Universe
  $string->replace('world', 'Universe', 'i'); # Hello Universe
  $string->replace(qr/world/i, 'Universe'); # Hello Universe
  $string->replace(qr/.*/, 'Nada'); # Nada

The replace method performs a smart search and replace operation and returns the
modified string (if any modification occurred). This method optionally takes a
replacement modifier as it's final argument. Note, this operation expects the
2nd argument to be a replacement String. This method returns a
L<Data::Object::String> object.

=cut

=method reverse

  # given 'dlrow ,olleH'

  $string->reverse; # Hello, world

The reverse method returns a string where the characters in the string are in
the opposite order. This method returns a L<Data::Object::String> object.

=cut

=method rindex

  # given 'explain the unexplainable'

  $string->rindex('explain'); # 14
  $string->rindex('explain', 0); # 0
  $string->rindex('explain', 21); # 14
  $string->rindex('explain', 22); # 14
  $string->rindex('explain', 23); # 14
  $string->rindex('explain', 20); # 14
  $string->rindex('explain', 14); # 0
  $string->rindex('explain', 13); # 0
  $string->rindex('explain', 0); # 0
  $string->rindex('explained'); # -1

The rindex method searches for the argument within the string and returns the
position of the last occurrence of the argument. This method optionally takes a
second argument which would be the position within the string to start
searching from (beginning at or before the position). By default, starts
searching from the end of the string. This method returns a data type object to
be determined after execution.

=cut

=method roles

  # given $string

  $string->roles;

The roles method returns the list of roles attached to object. This method
returns a L<Data::Object::Array> object.

=cut

=method say

  # given 'exciting'

  $string->say; # 'exciting\n'

The say method outputs the value represented by the object appended with a
newline to STDOUT and returns true. This method returns a L<Data::Object::Number>
object.

=cut

=method snakecase

  # given 'hello world'

  $string->snakecase; # helloWorld

The snakecase method modifies the string such that it will no longer have any
non-alphanumeric characters and each word (group of alphanumeric characters
separated by 1 or more non-alphanumeric characters) is capitalized. The only
difference between this method and the camelcase method is that this method
ensures that the first character will always be lowercased. Note, this method
modifies the string. This method returns a L<Data::Object::String> object.

=cut

=method split

  # given 'name, age, dob, email'

  $string->split(', '); # ['name', 'age', 'dob', 'email']
  $string->split(', ', 2); # ['name', 'age, dob, email']
  $string->split(qr/\,\s*/); # ['name', 'age', 'dob', 'email']
  $string->split(qr/\,\s*/, 2); # ['name', 'age, dob, email']

The split method splits the string into a list of strings, separating each
chunk by the argument (string or regexp object), and returns that list as an
array reference. This method optionally takes a second argument which would be
the limit (number of matches to capture). Note, this operation expects the 1st
argument to be a Regexp object or a String. This method returns a
L<Data::Object::Array> object.

=cut

=method strip

  # given 'one,  two,  three'

  $string->strip; # one, two, three

The strip method returns the string replacing occurences of 2 or more
whitespaces with a single whitespace. This method returns a
L<Data::Object::String> object.

=cut

=method throw

  # given $string

  $string->throw;

The throw method terminates the program using the core die keyword, passing the
object to the L<Data::Object::Exception> class as the named parameter C<object>.
If captured this method returns a L<Data::Object::Exception> object.

=cut

=method titlecase

  # given 'mr. john doe'

  $string->titlecase; # Mr. John Doe

The titlecase method returns the string capitalizing the first character of
each word (group of alphanumeric characters separated by 1 or more whitespaces).
Note, this method modifies the string. This method returns a
L<Data::Object::String> object.

=cut

=method trim

  # given ' system is   ready   '

  $string->trim; # system is   ready

The trim method removes 1 or more consecutive leading and/or trailing spaces
from the string. This method returns a L<Data::Object::String> object.

=cut

=method type

  # given $string

  $string->type; # STRING

The type method returns a string representing the internal data type object name.
This method returns a L<Data::Object::String> object.

=cut

=method uc

  # given 'exciting'

  $string->uc; # EXCITING

The uc method returns an uppercased version of the string. This method returns a
L<Data::Object::String> object. This method is an alias to the uppercase method.

=cut

=method ucfirst

  # given 'exciting'

  $string->ucfirst; # Exciting

The ucfirst method returns a the string with the first character uppercased.
This method returns a L<Data::Object::String> object.

=cut

=method uppercase

  # given 'exciting'

  $string->uppercase; # EXCITING

The uppercase method is an alias to the uc method. This method returns a
L<Data::Object::String> object.

=cut

=method words

  # given "is this a bug we're experiencing"

  $string->words; # ["is","this","a","bug","we're","experiencing"]

The words method splits the string into a list of strings, separating each
group of characters by 1 or more consecutive spaces, and returns that list as an
array reference. This method returns a L<Data::Object::Array> object.

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
