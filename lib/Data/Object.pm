# ABSTRACT: Object Orientation for Perl 5
package Data::Object;

use 5.014;

use strict;
use warnings;

use Data::Object::Export ':all';

use parent 'Exporter';

# VERSION

our @EXPORT_OK = @Data::Object::Export::EXPORT_OK;
our %EXPORT_TAGS = %Data::Object::Export::EXPORT_TAGS;

sub new {
  shift and goto &cast;
}

1;

=encoding utf8

=head1 SYNOPSIS

  use Data::Object;

  # returns a code object
  my $object = Data::Object->new(sub{ join ' ', @_ });

  # returns true
  $object->isa('Data::Object::Code');

  # returns a string object
  my $string = $code->call('Hello', 'World');

  # returns a new string object
  $string = $string->split('')->reverse->join('')->uppercase;

  # returns a number object (returns true) and outputs "DLROW OLLEH"
  my $result = $string->say;

  # returns true
  $result->isa('Data::Object::Number');

=head1 DESCRIPTION

Data::Object is a framework for writing structured and highly object-oriented
Perl 5 software programs. Additionally, this distribution provides classes
which wrap Perl 5 native data types and provides methods for operating on the
data.

=cut

=export all

  use Data::Object qw(:all);

The all export tag will export all exportable functions.

=cut

=export core

  use Data::Object qw(:core);

The core export tag will export the exportable functions C<const>, C<deduce>,
C<deduce_deep>, C<detract>, C<detract_deep>, C<immutable>, C<load>, C<prototype>,
C<reify>, and C<throw> exclusively.

=cut

=export data

  use Data::Object qw(:data);

The data export tag will export all exportable functions whose names are
prefixed with the word "data".

=cut

=export type

  use Data::Object qw(:type);

The type export tag will export all exportable functions whose names are
prefixed with the word "type".

=cut

=function confess

  # die with error and stacktrace

  confess "ooops, something went wrong!";

The confess function causes the program to die with a stacktrace. This function
is passed in from the L<Carp> module.

=cut

=function croak

  # die with error

  croak "ooops, something went wrong!";

The croak function causes the program to die from perspective of caller. This
function is passed in from the L<Carp> module.

=cut

=function carp

  # emit warning

  carp "ooops, something went wrong!";

The carp function causes the program to emit a warning from perspective of
caller. This function is passed in from the L<Carp> module.

=cut

=function const

  # given 1.098765;

  const VERSION => 1.098765;

The const function creates a constant function using the name and expression
supplied to it. A constant function is a function that does not accept any
arguments and whose result(s) are deterministic.

=cut

=function data_array

  # given [2..5];

  $object = data_array [2..5];
  $object->isa('Data::Object::Array');

The data_array function returns a L<Data::Object::Array> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_array> function is an alias to this function.

=cut

=function data_code

  # given sub { 1 };

  $object = data_code sub { 1 };
  $object->isa('Data::Object::Code');

The data_code function returns a L<Data::Object::Code> instance which wraps the
provided data type and can be used to perform operations on the data. The
C<type_code> function is an alias to this function.

=cut

=function data_float

  # given 5.25;

  $object = data_float 5.25;
  $object->isa('Data::Object::Float');

The data_float function returns a L<Data::Object::Float> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_float> function is an alias to this function.

=cut

=function data_hash

  # given {1..4};

  $object = data_hash {1..4};
  $object->isa('Data::Object::Hash');

The data_hash function returns a L<Data::Object::Hash> instance which wraps the
provided data type and can be used to perform operations on the data. The
C<type_hash> function is an alias to this function.

=cut

=function data_integer

  # given -100;

  $object = data_integer -100;
  $object->isa('Data::Object::Integer');

The data_integer function returns a L<Data::Object::Object> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_integer> function is an alias to this function.

=cut

=function data_number

  # given 100;

  $object = data_number 100;
  $object->isa('Data::Object::Number');

The data_number function returns a L<Data::Object::Number> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_number> function is an alias to this function.

=cut

=function data_regexp

  # given qr/test/;

  $object = data_regexp qr/test/;
  $object->isa('Data::Object::Regexp');

The data_regexp function returns a L<Data::Object::Regexp> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_regexp> function is an alias to this function.

=cut

=function data_scalar

  # given \*main;

  $object = data_scalar \*main;
  $object->isa('Data::Object::Scalar');

The data_scalar function returns a L<Data::Object::Scalar> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_scalar> function is an alias to this function.

=cut

=function data_string

  # given 'abcdefghi';

  $object = data_string 'abcdefghi';
  $object->isa('Data::Object::String');

The data_string function returns a L<Data::Object::String> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_string> function is an alias to this function.

=cut

=function data_undef

  # given undef;

  $object = data_undef undef;
  $object->isa('Data::Object::Undef');

The data_undef function returns a L<Data::Object::Undef> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_undef> function is an alias to this function.

=cut

=function data_universal

  # given 0;

  $object = data_universal 0;
  $object->isa('Data::Object::Universal');

The data_universal function returns a L<Data::Object::Universal> instance which
wraps the provided data type and can be used to perform operations on the data.
The C<type_universal> function is an alias to this function.

=cut

=function deduce

  # given qr/\w+/;

  $object = deduce qr/\w+/;
  $object->isa('Data::Object::Regexp');

The deduce function returns a data type object instance based upon the deduced
type of data provided.

=cut

=function deduce_deep

  # given {1,2,3,{4,5,6,[-1]}}

  $deep = deduce_deep {1,2,3,{4,5,6,[-1]}};

  # Data::Object::Hash {
  #   1 => Data::Object::Number ( 2 ),
  #   3 => Data::Object::Hash {
  #      4 => Data::Object::Number ( 5 ),
  #      6 => Data::Object::Array [ Data::Object::Integer ( -1 ) ],
  #   },
  # }

The deduce_deep function returns a data type object. If the data provided is
complex, this function traverses the data converting all nested data to objects.
Note: Blessed objects are not traversed.

=cut

=function deduce_type

  # given qr/\w+/;

  $type = deduce_type qr/\w+/; # REGEXP

The deduce_type function returns a data type description for the type of data
provided, represented as a string in capital letters.

=cut

=function detract

  # given bless({1..4}, 'Data::Object::Hash');

  $object = detract $object; # {1..4}

The detract function returns a value of native type, based upon the underlying
reference of the data type object provided.

=cut

=function detract_deep

  # given {1,2,3,{4,5,6,[-1, 99, bless({}), sub { 123 }]}};

  my $object = deduce_deep $object;
  my $revert = detract_deep $object; # produces ...

  # {
  #   '1' => 2,
  #   '3' => {
  #     '4' => 5,
  #     '6' => [ -1, 99, bless({}, 'main'), sub { ... } ]
  #     }
  # }

The detract_deep function returns a value of native type. If the data provided
is complex, this function traverses the data converting all nested data type
objects into native values using the objects underlying reference. Note:
Blessed objects are not traversed.

=cut

=function immutable

  # given [1,2,3];

  $object = immutable data_array [1,2,3];
  $object->isa('Data::Object::Array); # via Data::Object::Immutable

The immutable function makes the data type object provided immutable. This
function loads L<Data::Object::Immutable> and returns the object provided as an
argument.

=cut

=function load

  # given 'List::Util';

  $package = load 'List::Util'; # List::Util if loaded

The load function attempts to dynamically load a module and either dies or
returns the package name of the loaded module.

=cut

=function prototype

  # given ('$name' => [is => 'ro']);

  my $proto  = data_prototype '$name' => [is => 'ro'];
  my $class  = $proto->create; # via Data::Object::Prototype
  my $object = $class->new(name => '...');

The prototype function returns a prototype object which can be used to
generate classes, objects, and derivatives. This function loads
L<Data::Object::Prototype> and returns an object based on the arguments
provided.

=cut

=function reify

  # given [1..9];

  $array = reify [1..9]; # Data::Object::Array

The reify function will determine the type of the value provided and return it
as a data type object. This method is an alias to the C<deduce_deep> function.

=cut

=function throw

  # given $message;

  throw $message; # An exception (...) was thrown in -e at line 1

The throw function will dynamically load and throw an exception object. This
function takes all arguments accepted by the L<Data::Object::Exception> class.

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