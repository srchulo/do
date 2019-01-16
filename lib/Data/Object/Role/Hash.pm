# ABSTRACT: Hash Object Role for Perl 5
package Data::Object::Role::Hash;

use 5.014;

use strict;
use warnings;

use Data::Object::Role;

use Data::Object '$dispatch';

our @ROLES = map with($_), qw(
  Data::Object::Role::Item
  Data::Object::Role::Collection
);

my $data = &$dispatch('Data::Object');
my $func = &$dispatch('Data::Object::Config::Hash');

# VERSION

sub clear {
  return &$data('cast', &$func('clear', @_));
}

sub count {
  return &$data('cast', &$func('count', @_));
}

sub defined {
  return &$data('cast', &$func('defined', @_));
}

sub delete {
  return &$data('cast', &$func('delete', @_));
}

sub each {
  return &$data('cast', &$func('each', @_));
}

sub each_key {
  return &$data('cast', &$func('each_key', @_));
}

sub each_n_values {
  return &$data('cast', &$func('each_n_values', @_));
}

sub each_value {
  return &$data('cast', &$func('each_value', @_));
}

sub empty {
  return &$data('cast', &$func('empty', @_));
}

sub eq {
  return &$data('cast', &$func('eq', @_));
}

sub exists {
  return &$data('cast', &$func('exists', @_));
}

sub filter_exclude {
  return &$data('cast', &$func('filter_exclude', @_));
}

sub filter_include {
  return &$data('cast', &$func('filter_include', @_));
}

sub fold {
  return &$data('cast', &$func('fold', @_));
}

sub ge {
  return &$data('cast', &$func('ge', @_));
}

sub get {
  return &$data('cast', &$func('get', @_));
}

sub grep {
  return &$data('cast', &$func('grep', @_));
}

sub gt {
  return &$data('cast', &$func('gt', @_));
}

sub head {
  return &$data('cast', &$func('head', @_));
}

sub invert {
  return &$data('cast', &$func('invert', @_));
}

sub iterator {
  return &$data('cast', &$func('iterator', @_));
}

sub join {
  return &$data('cast', &$func('join', @_));
}

sub keys {
  return &$data('cast', &$func('keys', @_));
}

sub le {
  return &$data('cast', &$func('le', @_));
}

sub length {
  return &$data('cast', &$func('length', @_));
}

sub list {
  return &$data('cast', &$func('list', @_));
}

sub lookup {
  return &$data('cast', &$func('lookup', @_));
}

sub lt {
  return &$data('cast', &$func('lt', @_));
}

sub map {
  return &$data('cast', &$func('map', @_));
}

sub merge {
  return &$data('cast', &$func('merge', @_));
}

sub ne {
  return &$data('cast', &$func('ne', @_));
}

sub pairs {
  return &$data('cast', &$func('pairs', @_));
}

sub reset {
  return &$data('cast', &$func('reset', @_));
}

sub reverse {
  return &$data('cast', &$func('reverse', @_));
}

sub set {
  return &$data('cast', &$func('set', @_));
}

sub slice {
  return &$data('cast', &$func('slice', @_));
}

sub sort {
  return &$data('cast', &$func('sort', @_));
}

sub tail {
  return &$data('cast', &$func('tail', @_));
}

sub unfold {
  return &$data('cast', &$func('unfold', @_));
}

sub values {
  return &$data('cast', &$func('values', @_));
}

1;

=encoding utf8

=head1 SYNOPSIS

  use Data::Object::Class;

  with 'Data::Object::Role::Hash';

=cut

=head1 DESCRIPTION

Data::Object::Role::Hash provides routines for operating on Perl 5 hash
references.

=cut

=head1 CODIFICATION

Certain methods provided by the this module support codification, a process
which converts a string argument into a code reference which can be used to
supply a callback to the method called. A codified string can access its
arguments by using variable names which correspond to letters in the alphabet
which represent the position in the argument list. For example:

  $hash->example('$a + $b * $c', 100);

  # if the example method does not supply any arguments automatically then
  # the variable $a would be assigned the user-supplied value of 100,
  # however, if the example method supplies two arguments automatically then
  # those arugments would be assigned to the variables $a and $b whereas $c
  # would be assigned the user-supplied value of 100

  # e.g.

  $hash->each('the value at $key is $value');

  # or

  $hash->each_n_values(4, 'the value at $key0 is $value0');

  # etc

Any place a codified string is accepted, a coderef or L<Data::Object::Code>
object is also valid. Arguments are passed through the usual C<@_> list.

=cut

=head1 ROLES

This package is comprised of the following roles.

=over 4

=item *

L<Data::Object::Role::Collection>

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

L<Data::Object::Role::List>

=item *

L<Data::Object::Role::Output>

=item *

L<Data::Object::Role::Throwable>

=item *

L<Data::Object::Role::Type>

=back

=cut

=method clear

  # given {1..8}

  $hash->clear; # {}

The clear method is an alias to the empty method. This method returns a
hash object. This method is an alias to the empty method.

=cut

=method count

  # given {1..4}

  my $count = $hash->count; # 2

The count method returns the total number of keys defined. This method returns
a number object.

=cut

=method data

  # given $hash

  $hash->data; # original value

The data method returns the original and underlying value contained by the
object. This method is an alias to the detract method.

=cut

=method defined

  # given {1..8,9,undef}

  $hash->defined(1); # 1; true
  $hash->defined(0); # 0; false
  $hash->defined(9); # 0; false

The defined method returns true if the value matching the key specified in the
argument if defined, otherwise returns false. This method returns a
number object.

=cut

=method delete

  # given {1..8}

  $hash->delete(1); # 2

The delete method returns the value matching the key specified in the argument
and returns the value. This method returns a data type object to be determined
after execution.

=cut

=method detract

  # given $hash

  $hash->detract; # original value

The detract method returns the original and underlying value contained by the
object.

=cut

=method dump

  # given {1..4}

  $hash->dump; # '{1=>2,3=>4}'

The dump method returns returns a string representation of the object.
This method returns a string value.

=cut

=method each

  # given {1..8}

  $hash->each(sub{
    my $key   = shift; # 1
    my $value = shift; # 2
  });

The each method iterates over each element in the hash, executing the code
reference supplied in the argument, passing the routine the key and value at the
current position in the loop. This method supports codification, i.e, takes an
argument which can be a codifiable string, a code reference, or a code data type
object. This method returns a hash value.

=cut

=method each_key

  # given {1..8}

  $hash->each_key(sub{
    my $key = shift; # 1
  });

The each_key method iterates over each element in the hash, executing the code
reference supplied in the argument, passing the routine the key at the current
position in the loop. This method supports codification, i.e, takes an argument
which can be a codifiable string, a code reference, or a code data type object.
This method returns a hash value.

=cut

=method each_n_values

  # given {1..8}

  $hash->each_n_values(4, sub {
    my $value_1 = shift; # 2
    my $value_2 = shift; # 4
    my $value_3 = shift; # 6
    my $value_4 = shift; # 8
    ...
  });

The each_n_values method iterates over each element in the hash, executing the
code reference supplied in the argument, passing the routine the next n values
until all values have been seen. This method supports codification, i.e, takes
an argument which can be a codifiable string, a code reference, or a code data
type object. This method returns a hash value.

=cut

=method each_value

  # given {1..8}

  $hash->each_value(sub {
    my $value = shift; # 2
  });

The each_value method iterates over each element in the hash, executing the code
reference supplied in the argument, passing the routine the value at the current
position in the loop. This method supports codification, i.e, takes an argument
which can be a codifiable string, a code reference, or a code data type object.
This method returns a hash value.

=cut

=method empty

  # given {1..8}

  $hash->empty; # {}

The empty method drops all elements from the hash. This method returns a
hash object. Note: This method modifies the hash.

=cut

=method eq

  # given $hash

  $hash->eq; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method exists

  # given {1..8,9,undef}

  $hash->exists(1); # 1; true
  $hash->exists(0); # 0; false

The exists method returns true if the value matching the key specified in the
argument exists, otherwise returns false. This method returns a
number object.

=cut

=method filter_exclude

  # given {1..8}

  $hash->filter_exclude(1,3); # {5=>6,7=>8}

The filter_exclude method returns a hash reference consisting of all key/value
pairs in the hash except for the pairs whose keys are specified in the
arguments. This method returns a hash value.

=cut

=method filter_include

  # given {1..8}

  $hash->filter_include(1,3); # {1=>2,3=>4}

The filter_include method returns a hash reference consisting of only key/value
pairs whose keys are specified in the arguments. This method returns a
hash object.

=cut

=method fold

  # given {3,[4,5,6],7,{8,8,9,9}}

  $hash->fold; # {'3:0'=>4,'3:1'=>5,'3:2'=>6,'7.8'=>8,'7.9'=>9}

The fold method returns a single-level hash reference consisting of key/value
pairs whose keys are paths (using dot-notation where the segments correspond to
nested hash keys and array indices) mapped to the nested values. This method
returns a hash value.

=cut

=method ge

  # given $hash

  $hash->ge; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method get

  # given {1..8}

  $hash->get(5); # 6

The get method returns the value of the element in the hash whose key
corresponds to the key specified in the argument. This method returns a data
type object to be determined after execution.

=cut

=method grep

  # given {1..4}

  $hash->grep(sub {
    shift >= 3
  });

  # {3=>5}

The grep method iterates over each key/value pair in the hash, executing the
code reference supplied in the argument, passing the routine the key and value
at the current position in the loop and returning a new hash reference
containing the elements for which the argument evaluated true. This method
supports codification, i.e, takes an argument which can be a codifiable string,
a code reference, or a code data type object. This method returns a
hash object.

=cut

=method gt

  # given $hash

  $hash->gt; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method head

  # given $hash

  $hash->head; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method invert

  # given {1..8,9,undef,10,''}

  $hash->invert; # {''=>10,2=>1,4=>3,6=>5,8=>7}

The invert method returns the hash after inverting the keys and values
respectively. Note, keys with undefined values will be dropped, also, this
method modifies the hash. This method returns a hash value.
Note: This method modifies the hash.

=cut

=method iterator

  # given {1..8}

  my $iterator = $hash->iterator;
  while (my $value = $iterator->next) {
    say $value; # 2
  }

The iterator method returns a code reference which can be used to iterate over
the hash. Each time the iterator is executed it will return the values of the
next element in the hash until all elements have been seen, at which point
the iterator will return an undefined value. This method returns a
code object.

=cut

=method join

  # given $hash

  $hash->join; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.
=cut

=method keys

  # given {1..8}

  $hash->keys; # [1,3,5,7]

The keys method returns an array reference consisting of all the keys in the
hash. This method returns an array value.

=cut

=method le

  # given $hash

  $hash->le; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method length

  # given {1..8}

  my $length = $hash->length; # 4

The length method returns the number of keys in the hash. This method
return a number object.

=cut

=method list

  # given $hash

  my $list = $hash->list;

The list method returns a shallow copy of the underlying hash reference as an
array reference. This method return an array object.

=cut

=method lookup

  # given {1..3,{4,{5,6,7,{8,9,10,11}}}}

  $hash->lookup('3.4.7'); # {8=>9,10=>11}
  $hash->lookup('3.4'); # {5=>6,7=>{8=>9,10=>11}}
  $hash->lookup(1); # 2

The lookup method returns the value of the element in the hash whose key
corresponds to the key specified in the argument. The key can be a string which
references (using dot-notation) nested keys within the hash. This method will
return undefined if the value is undef or the location expressed in the argument
can not be resolved. Please note, keys containing dots (periods) are not
handled. This method returns a data type object to be determined after
execution.

=cut

=method lt

  # given $hash

  $hash->lt; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method map

  # given {1..4}

  $hash->map(sub {
    shift + 1
  });

The map method iterates over each key/value in the hash, executing the code
reference supplied in the argument, passing the routine the value at the
current position in the loop and returning a new array reference containing the
elements for which the argument returns a value or non-empty list. This method
returns a L<Data::Object::Array> object.

=cut

=method merge

  # given {1..8}

  $hash->merge({7,7,9,9}); # {1=>2,3=>4,5=>6,7=>7,9=>9}

The merge method returns a hash reference where the elements in the hash and
the elements in the argument(s) are merged. This operation performs a deep
merge and clones the datasets to ensure no side-effects. The merge behavior
merges hash references only, all other data types are assigned with precendence
given to the value being merged. This method returns a L<Data::Object::Hash>
object.

=cut

=method methods

  # given $hash

  $hash->methods;

The methods method returns the list of methods attached to object. This method
returns an array value.

=cut

=method ne

  # given $hash

  $hash->ne; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method new

  # given 1..4

  my $hash = Data::Object::Hash->new(1..4);
  my $hash = Data::Object::Hash->new({1..4});

The new method expects a list or hash reference and returns a new class
instance.

=cut

=method pairs

  # given {1..8}

  $hash->pairs; # [[1,2],[3,4],[5,6],[7,8]]

The pairs method is an alias to the pairs_array method. This method returns a
array object. This method is an alias to the pairs_array
method.

=cut

=method print

  # given {1..4}

  $hash->print; # '{1=>2,3=>4}'

The print method outputs the value represented by the object to STDOUT and
returns true. This method returns a number value.

=cut

=method reset

  # given {1..8}

  $hash->reset; # {1=>undef,3=>undef,5=>undef,7=>undef}

The reset method returns nullifies the value of each element in the hash. This
method returns a hash value. Note: This method modifies the
hash.

=cut

=method reverse

  # given {1..8,9,undef}

  $hash->reverse; # {8=>7,6=>5,4=>3,2=>1}

The reverse method returns a hash reference consisting of the hash's keys and
values inverted. Note, keys with undefined values will be dropped. This method
returns a hash value.

=cut

=method roles

  # given $hash

  $hash->roles;

The roles method returns the list of roles attached to object. This method
returns an array value.

=cut

=method say

  # given {1..4}

  $hash->say; # '{1=>2,3=>4}\n'

The say method outputs the value represented by the object appended with a
newline to STDOUT and returns true. This method returns a L<Data::Object::Number>
object.

=cut

=method set

  # given {1..8}

  $hash->set(1,10); # 10
  $hash->set(1,12); # 12
  $hash->set(1,0); # 0

The set method returns the value of the element in the hash corresponding to
the key specified by the argument after updating it to the value of the second
argument. This method returns a data type object to be determined after
execution.

=cut

=method slice

  # given {1..8}

  my $slice = $hash->slice(1,5); # {1=>2,5=>6}

The slice method returns a hash reference containing the elements in the hash
at the key(s) specified in the arguments. This method returns a
hash object.

=cut

=method sort

  # given $hash

  $hash->sort; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method tail

  # given $hash

  $hash->tail; # exception thrown

This method is a consumer requirement but has no function and is not implemented.
This method will throw an exception if called.

=cut

=method throw

  # given $hash

  $hash->throw;

The throw method terminates the program using the core die keyword, passing the
object to the L<Data::Object::Exception> class as the named parameter C<object>.
If captured this method returns an exception value.

=cut

=method type

  # given $hash

  $hash->type; # HASH

The type method returns a string representing the internal data type object name.
This method returns a string value.

=cut

=method unfold

  # given {'3:0'=>4,'3:1'=>5,'3:2'=>6,'7.8'=>8,'7.9'=>9}

  $hash->unfold; # {3=>[4,5,6],7,{8,8,9,9}}

The unfold method processes previously folded hash references and returns an
unfolded hash reference where the keys, which are paths (using dot-notation
where the segments correspond to nested hash keys and array indices), are used
to created nested hash and/or array references. This method returns a
hash object.

=cut

=method values

  # given {1..8}

  $hash->values; # [2,4,6,8]
  $hash->values(1,3); # [2,4]

The values method returns an array reference consisting of the values of the
elements in the hash. This method returns an array value.

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
