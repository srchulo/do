# ABSTRACT: Type Library for Perl 5
package Data::Object::Config::Type;

use 5.014;

use strict;
use warnings;

use Type::Library -base;
use Type::Utils -all;

use Data::Object::Type::Any;
use Data::Object::Type::Array;
use Data::Object::Type::Code;
use Data::Object::Type::Float;
use Data::Object::Type::Hash;
use Data::Object::Type::Integer;
use Data::Object::Type::Number;
use Data::Object::Type::Regexp;
use Data::Object::Type::Scalar;
use Data::Object::Type::String;
use Data::Object::Type::Undef;

# VERSION

extends 'Types::Standard';
extends 'Types::Common::Numeric';
extends 'Types::Common::String';

# custom data types

register Data::Object::Type::Any;
register Data::Object::Type::Array;
register Data::Object::Type::Code;
register Data::Object::Type::Float;
register Data::Object::Type::Hash;
register Data::Object::Type::Integer;
register Data::Object::Type::Number;
register Data::Object::Type::Regexp;
register Data::Object::Type::Scalar;
register Data::Object::Type::String;
register Data::Object::Type::Undef;

1;

=encoding utf8

=head1 SYNOPSIS

  use Data::Object::Config::Type;

=cut

=head1 DESCRIPTION

Data::Object::Config::Type is a L<Type::Tiny> type library that extends the
L<Types::Standard>, L<Types::Common::Numeric>, and L<Types::Common::String>
libraries and adds type constraints and coercions for L<Data::Object> objects.

=cut

=type Any

  has data => (
    is  => 'rw',
    isa => Any,
  );

The Any type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Any> function can be
used to throw an exception is the argument can not be validated. The C<is_Any>
function can be used to return true or false if the argument can not be
validated.

=cut

=type AnyObj

  has data => (
    is  => 'rw',
    isa => AnyObj,
  );

The AnyObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::Any> object. The
C<assert_AnyObj> function can be used to throw an exception if the argument can
not be validated. The C<is_AnyObj> function can be used to return true or false if
the argument can not be validated.

=cut

=type AnyObject

  has data => (
    is  => 'rw',
    isa => AnyObject,
  );

The AnyObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Any> object. The
C<assert_AnyObject> function can be used to throw an exception if the argument can
not be validated. The C<is_AnyObject> function can be used to return true or false
if the argument can not be validated.

=cut

=type ArrayObj

  has data => (
    is  => 'rw',
    isa => ArrayObj,
  );

The ArrayObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::Array> object. The
C<assert_ArrayObj> function can be used to throw an exception if the argument can
not be validated. The C<is_ArrayObj> function can be used to return true or false
if the argument can not be validated.

=cut

=type ArrayObject

  has data => (
    is  => 'rw',
    isa => ArrayObject,
  );

The ArrayObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Array> object. The
C<assert_ArrayObject> function can be used to throw an exception if the argument
can not be validated. The C<is_ArrayObject> function can be used to return true or
false if the argument can not be validated.

=cut

=type ArrayRef

  has data => (
    is  => 'rw',
    isa => ArrayRef,
  );

The ArrayRef type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_ArrayRef
function> can be used to throw an exception if the argument can not be
validated. The C<is_ArrayRef> function can be used to return true or false if the
argument can not be validated.

=cut

=type Bool

  has data => (
    is  => 'rw',
    isa => Bool,
  );

The Bool type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Bool> function can be
used to throw an exception if the argument can not be validated. The C<is_Bool>
function can be used to return true or false if the argument can not be
validated.

=cut

=type ClassName

  has data => (
    is  => 'rw',
    isa => ClassName['MyClass'],
  );

The ClassName type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_ClassName
function> can be used to throw an exception if the argument can not be
validated. The C<is_ClassName> function can be used to return true or false if the
argument can not be validated.

=cut

=type CodeObj

  has data => (
    is  => 'rw',
    isa => CodeObj,
  );

The CodeObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::Code> object. The C<assert_CodeObj
function> can be used to throw an exception if the argument can not be
validated. The C<is_CodeObj> function can be used to return true or false if the
argument can not be validated.

=cut

=type CodeObject

  has data => (
    is  => 'rw',
    isa => CodeObject,
  );

The CodeObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Code> object. The
C<assert_CodeObject> function can be used to throw an exception if the argument
can not be validated. The C<is_CodeObject> function can be used to return true or
false if the argument can not be validated.

=cut

=type CodeRef

  has data => (
    is  => 'rw',
    isa => CodeRef,
  );

The CodeRef type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_CodeRef> function
can be used to throw an exception if the argument can not be validated. The
C<is_CodeRef> function can be used to return true or false if the argument can not
be validated.

=cut

=type ConsumerOf

  has data => (
    is  => 'rw',
    isa => ConsumerOf['MyRole'],
  );

The ConsumerOf type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_ConsumerOf
function> can be used to throw an exception if the argument can not be
validated. The C<is_ConsumerOf> function can be used to return true or false if
the argument can not be validated.

=cut

=type Defined

  has data => (
    is  => 'rw',
    isa => Defined,
  );

The Defined type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_Defined> function
can be used to throw an exception if the argument can not be validated. The
C<is_Defined> function can be used to return true or false if the argument can not
be validated.

=cut

=type Dict

  has data => (
    is  => 'rw',
    isa => Dict,
  );

The Dict type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Dict> function can be
used to throw an exception if the argument can not be validated. The C<is_Dict>
function can be used to return true or false if the argument can not be
validated.

=cut

=type Enum

  has data => (
    is  => 'rw',
    isa => Enum,
  );

The Enum type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Enum> function can be
used to throw an exception if the argument can not be validated. The C<is_Enum>
function can be used to return true or false if the argument can not be
validated.

=cut

=type FileHandle

  has data => (
    is  => 'rw',
    isa => FileHandle,
  );

The FileHandle type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_FileHandle
function> can be used to throw an exception if the argument can not be
validated. The C<is_FileHandle> function can be used to return true or false if
the argument can not be validated.

=cut

=type FloatObj

  has data => (
    is  => 'rw',
    isa => FloatObj,
  );

The FloatObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::Float> object. The
C<assert_FloatObj> function can be used to throw an exception if the argument can
not be validated. The C<is_FloatObj> function can be used to return true or false
if the argument can not be validated.

=cut

=type FloatObject

  has data => (
    is  => 'rw',
    isa => FloatObject,
  );

The FloatObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Float> object. The
C<assert_FloatObject> function can be used to throw an exception if the argument
can not be validated. The C<is_FloatObject> function can be used to return true or
false if the argument can not be validated.

=cut

=type GlobRef

  has data => (
    is  => 'rw',
    isa => GlobRef,
  );

The GlobRef type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_GlobRef> function
can be used to throw an exception if the argument can not be validated. The
C<is_GlobRef> function can be used to return true or false if the argument can not
be validated.

=cut

=type HasMethods

  has data => (
    is  => 'rw',
    isa => HasMethods[...],
  );

The HasMethods type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_HasMethods
function> can be used to throw an exception if the argument can not be
validated. The C<is_HasMethods> function can be used to return true or false if
the argument can not be validated.

=cut

=type HashObj

  has data => (
    is  => 'rw',
    isa => HashObj,
  );

The HashObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::Hash> object. The C<assert_HashObj
function> can be used to throw an exception if the argument can not be
validated. The C<is_HashObj> function can be used to return true or false if the
argument can not be validated.

=cut

=type HashObject

  has data => (
    is  => 'rw',
    isa => HashObject,
  );

The HashObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Hash> object. The
C<assert_HashObject> function can be used to throw an exception if the argument
can not be validated. The C<is_HashObject> function can be used to return true or
false if the argument can not be validated.

=cut

=type HashRef

  has data => (
    is  => 'rw',
    isa => HashRef,
  );

The HashRef type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_HashRef> function
can be used to throw an exception if the argument can not be validated. The
C<is_HashRef> function can be used to return true or false if the argument can not
be validated.

=cut

=type InstanceOf

  has data => (
    is  => 'rw',
    isa => InstanceOf['MyClass'],
  );

The InstanceOf type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_InstanceOf
function> can be used to throw an exception if the argument can not be
validated. The C<is_InstanceOf> function can be used to return true or false if
the argument can not be validated.

=cut

=type Int

  has data => (
    is  => 'rw',
    isa => Int,
  );

The Int type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Int> function can be
used to throw an exception if the argument can not be validated. The C<is_Int>
function can be used to return true or false if the argument can not be
validated.

=cut

=type IntObj

  has data => (
    is  => 'rw',
    isa => IntObj,
  );

The IntObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::Integer> object. The
C<assert_IntObj> function can be used to throw an exception if the argument can
not be validated. The C<is_IntObj> function can be used to return true or false if
the argument can not be validated.

=cut

=type IntObject

  has data => (
    is  => 'rw',
    isa => IntObject,
  );

The IntObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Integer> object. The
C<assert_IntObject> function can be used to throw an exception if the argument can
not be validated. The C<is_IntObject> function can be used to return true or false
if the argument can not be validated.

=cut

=type IntegerObj

  has data => (
    is  => 'rw',
    isa => IntegerObj,
  );

The IntegerObj type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Integer> object. The
C<assert_IntegerObj> function can be used to throw an exception if the argument
can not be validated. The C<is_IntegerObj> function can be used to return true or
false if the argument can not be validated.

=cut

=type IntegerObject

  has data => (
    is  => 'rw',
    isa => IntegerObject,
  );

The IntegerObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Integer> object. The
C<assert_IntegerObject> function can be used to throw an exception if the argument
can not be validated. The C<is_IntegerObject> function can be used to return true
or false if the argument can not be validated.

=cut

=type Item

  has data => (
    is  => 'rw',
    isa => Item,
  );

The Item type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Item> function can be
used to throw an exception if the argument can not be validated. The C<is_Item>
function can be used to return true or false if the argument can not be
validated.

=cut

=type LaxNum

  has data => (
    is  => 'rw',
    isa => LaxNum,
  );

The LaxNum type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_LaxNum> function
can be used to throw an exception if the argument can not be validated. The
C<is_LaxNum> function can be used to return true or false if the argument can not
be validated.

=cut

=type LowerCaseSimpleStr

  has data => (
    is  => 'rw',
    isa => LowerCaseSimpleStr,
  );

The LowerCaseSimpleStr type constraint is provided by the
L<Types::Common::String> library. Please see that documentation for more The
C<assert_LowerCaseSimpleStr> function can be used to throw an exception if the
argument can not be validated. The C<is_LowerCaseSimpleStr> function can be used
to return true or false if the argument can not be validated.
information.

=cut

=type LowerCaseStr

  has data => (
    is  => 'rw',
    isa => LowerCaseStr,
  );

The LowerCaseStr type constraint is provided by the L<Types::Common::String>
library. Please see that documentation for more information. The C<assert_type
function> can be used to throw an exception if the argument can not be
validated. The C<is_type> function can be used to return true or false if the
argument can not be validated.

=cut

=type Map

  has data => (
    is  => 'rw',
    isa => Map[Int, HashRef],
  );

The Map type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Map> function can be
used to throw an exception if the argument can not be validated. The C<is_Map>
function can be used to return true or false if the argument can not be
validated.

=cut

=type Maybe

  has data => (
    is  => 'rw',
    isa => Maybe,
  );

The Maybe type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Maybe> function can be
used to throw an exception if the argument can not be validated. The C<is_Maybe>
function can be used to return true or false if the argument can not be
validated.

=cut

=type NegativeInt

  has data => (
    is  => 'rw',
    isa => NegativeInt,
  );

The NegativeInt type constraint is provided by the L<Types::Common::Numeric>
library. Please see that documentation for more information. The
C<assert_NegativeInt> function can be used to throw an exception if the argument
can not be validated. The C<is_NegativeInt> function can be used to return true or
false if the argument can not be validated.

=cut

=type NegativeNum

  has data => (
    is  => 'rw',
    isa => NegativeNum,
  );

The NegativeNum type constraint is provided by the L<Types::Common::Numeric>
library. Please see that documentation for more information. The
C<assert_NegativeNum> function can be used to throw an exception if the argument
can not be validated. The C<is_NegativeNum> function can be used to return true or
false if the argument can not be validated.

=cut

=type NegativeOrZeroInt

  has data => (
    is  => 'rw',
    isa => NegativeOrZeroInt,
  );

The NegativeOrZeroInt type constraint is provided by the
L<Types::Common::Numeric> library. Please see that documentation for more The
C<assert_NegativeOrZeroInt> function can be used to throw an exception if the
argument can not be validated. The C<is_NegativeOrZeroInt> function can be used to
return true or false if the argument can not be validated.
information.

=cut

=type NegativeOrZeroNum

  has data => (
    is  => 'rw',
    isa => NegativeOrZeroNum,
  );

The NegativeOrZeroNum type constraint is provided by the
L<Types::Common::Numeric> library. Please see that documentation for more The
C<assert_type> function can be used to throw an exception if the argument can not
be validated. The C<is_type> function can be used to return true or false if the
argument can not be validated.
information.

=cut

=type NonEmptySimpleStr

  has data => (
    is  => 'rw',
    isa => NonEmptySimpleStr,
  );

The NonEmptySimpleStr type constraint is provided by the
L<Types::Common::String> library. Please see that documentation for more The
C<assert_type> function can be used to throw an exception if the argument can not
be validated. The C<is_type> function can be used to return true or false if the
argument can not be validated.
information.

=cut

=type NonEmptyStr

  has data => (
    is  => 'rw',
    isa => NonEmptyStr,
  );

The NonEmptyStr type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_type> function
can be used to throw an exception if the argument can not be validated. The
C<is_type> function can be used to return true or false if the argument can not be
validated.

=cut

=type Num

  has data => (
    is  => 'rw',
    isa => Num,
  );

The Num type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Num> function can be
used to throw an exception if the argument can not be validated. The C<is_Num>
function can be used to return true or false if the argument can not be
validated.

=cut

=type NumObj

  has data => (
    is  => 'rw',
    isa => NumObj,
  );

The NumObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::Number> object. The
C<assert_NumObj> function can be used to throw an exception if the argument can
not be validated. The C<is_NumObj> function can be used to return true or false if
the argument can not be validated.

=cut

=type NumObject

  has data => (
    is  => 'rw',
    isa => NumObject,
  );

The NumObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Number> object. The
C<assert_NumObject> function can be used to throw an exception if the argument can
not be validated. The C<is_NumObject> function can be used to return true or false
if the argument can not be validated.

=cut

=type NumberObj

  has data => (
    is  => 'rw',
    isa => NumberObj,
  );

The NumberObj type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Number> object. The
C<assert_NumberObj> function can be used to throw an exception if the argument can
not be validated. The C<is_NumberObj> function can be used to return true or false
if the argument can not be validated.

=cut

=type NumberObject

  has data => (
    is  => 'rw',
    isa => NumberObject,
  );

The NumberObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Number> object. The
C<assert_NumberObject> function can be used to throw an exception if the argument
can not be validated. The C<is_NumberObject> function can be used to return true
or false if the argument can not be validated.

=cut

=type NumericCode

  has data => (
    is  => 'rw',
    isa => NumericCode,
  );

The NumericCode type constraint is provided by the L<Types::Common::String>
library. Please see that documentation for more information. The
C<assert_NumericCode> function can be used to throw an exception if the argument
can not be validated. The C<is_NumericCode> function can be used to return true or
false if the argument can not be validated.

=cut

=type Object

  has data => (
    is  => 'rw',
    isa => Object,
  );

The Object type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_Object> function
can be used to throw an exception if the argument can not be validated. The
C<is_Object> function can be used to return true or false if the argument can not
be validated.

=cut

=type OptList

  has data => (
    is  => 'rw',
    isa => OptList,
  );

The OptList type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_OptList> function
can be used to throw an exception if the argument can not be validated. The
C<is_OptList> function can be used to return true or false if the argument can not
be validated.

=cut

=type Optional

  has data => (
    is  => 'rw',
    isa => Dict[id => Optional[Int]],
  );

The Optional type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_Optional
function> can be used to throw an exception if the argument can not be
validated. The C<is_Optional> function can be used to return true or false if the
argument can not be validated.

=cut

=type Overload

  has data => (
    is  => 'rw',
    isa => Overload,
  );

The Overload type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_Overload
function> can be used to throw an exception if the argument can not be
validated. The C<is_Overload> function can be used to return true or false if the
argument can not be validated.

=cut

=type Password

  has data => (
    is  => 'rw',
    isa => Password,
  );

The Password type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_Password
function> can be used to throw an exception if the argument can not be
validated. The C<is_Password> function can be used to return true or false if the
argument can not be validated.

=cut

=type PositiveInt

  has data => (
    is  => 'rw',
    isa => PositiveInt,
  );

The PositiveInt type constraint is provided by the L<Types::Common::Numeric>
library. Please see that documentation for more information. The
C<assert_PositiveInt> function can be used to throw an exception if the argument
can not be validated. The C<is_PositiveInt> function can be used to return true or
false if the argument can not be validated.

=cut

=type PositiveNum

  has data => (
    is  => 'rw',
    isa => PositiveNum,
  );

The PositiveNum type constraint is provided by the L<Types::Common::Numeric>
library. Please see that documentation for more information. The
C<assert_PositiveNum> function can be used to throw an exception if the argument
can not be validated. The C<is_PositiveNum> function can be used to return true or
false if the argument can not be validated.

=cut

=type PositiveOrZeroInt

  has data => (
    is  => 'rw',
    isa => PositiveOrZeroInt,
  );

The PositiveOrZeroInt type constraint is provided by the
L<Types::Common::Numeric> library. Please see that documentation for more The
C<assert_PositiveOrZeroInt> function can be used to throw an exception if the
argument can not be validated. The C<is_PositiveOrZeroInt> function can be used to
return true or false if the argument can not be validated.
information.

=cut

=type PositiveOrZeroNum

  has data => (
    is  => 'rw',
    isa => PositiveOrZeroNum,
  );

The PositiveOrZeroNum type constraint is provided by the
L<Types::Common::Numeric> library. Please see that documentation for more The
C<assert_type> function can be used to throw an exception if the argument can not
be validated. The C<is_type> function can be used to return true or false if the
argument can not be validated.
information.

=cut

=type Ref

  has data => (
    is  => 'rw',
    isa => Ref['SCALAR'],
  );

The Ref type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_type> function can be
used to throw an exception if the argument can not be validated. The C<is_type>
function can be used to return true or false if the argument can not be
validated.

=cut

=type RegexpObj

  has data => (
    is  => 'rw',
    isa => RegexpObj,
  );

The RegexpObj type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Regexp> object. The
C<assert_RegexpObj> function can be used to throw an exception if the argument can
not be validated. The C<is_RegexpObj> function can be used to return true or false
if the argument can not be validated.

=cut

=type RegexpObject

  has data => (
    is  => 'rw',
    isa => RegexpObject,
  );

The RegexpObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Regexp> object. The
C<assert_RegexpObject> function can be used to throw an exception if the argument
can not be validated. The C<is_RegexpObject> function can be used to return true
or false if the argument can not be validated.

=cut

=type RegexpRef

  has data => (
    is  => 'rw',
    isa => RegexpRef,
  );

The RegexpRef type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_RegexpRef
function> can be used to throw an exception if the argument can not be
validated. The C<is_RegexpRef> function can be used to return true or false if the
argument can not be validated.

=cut

=type RoleName

  has data => (
    is  => 'rw',
    isa => RoleName,
  );

The RoleName type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_RoleName
function> can be used to throw an exception if the argument can not be
validated. The C<is_RoleName> function can be used to return true or false if the
argument can not be validated.

=cut

=type ScalarObj

  has data => (
    is  => 'rw',
    isa => ScalarObj,
  );

The ScalarObj type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Scalar> object. The
C<assert_ScalarObj> function can be used to throw an exception if the argument can
not be validated. The C<is_ScalarObj> function can be used to return true or false
if the argument can not be validated.

=cut

=type ScalarObject

  has data => (
    is  => 'rw',
    isa => ScalarObject,
  );

The ScalarObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Scalar> object. The
C<assert_ScalarObject> function can be used to throw an exception if the argument
can not be validated. The C<is_ScalarObject> function can be used to return true
or false if the argument can not be validated.

=cut

=type ScalarRef

  has data => (
    is  => 'rw',
    isa => ScalarRef,
  );

The ScalarRef type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_ScalarRef
function> can be used to throw an exception if the argument can not be
validated. The C<is_ScalarRef> function can be used to return true or false if the
argument can not be validated.

=cut

=type SimpleStr

  has data => (
    is  => 'rw',
    isa => SimpleStr,
  );

The SimpleStr type constraint is provided by the L<Types::Common::String>
library. Please see that documentation for more information. The
C<assert_SimpleStr> function can be used to throw an exception if the argument can
not be validated. The C<is_SimpleStr> function can be used to return true or false
if the argument can not be validated.

=cut

=type SingleDigit

  has data => (
    is  => 'rw',
    isa => SingleDigit,
  );

The SingleDigit type constraint is provided by the L<Types::Common::Numeric>
library. Please see that documentation for more information. The
C<assert_SingleDigit> function can be used to throw an exception if the argument
can not be validated. The C<is_SingleDigit> function can be used to return true or
false if the argument can not be validated.

=cut

=type Str

  has data => (
    is  => 'rw',
    isa => Str,
  );

The Str type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Str> function can be
used to throw an exception if the argument can not be validated. The C<is_Str>
function can be used to return true or false if the argument can not be
validated.

=cut

=type StrMatch

  has data => (
    is  => 'rw',
    isa => StrMatch,
  );

The StrMatch type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_StrMatch
function> can be used to throw an exception if the argument can not be
validated. The C<is_StrMatch> function can be used to return true or false if the
argument can not be validated.

=cut

=type StrObj

  has data => (
    is  => 'rw',
    isa => StrObj,
  );

The StrObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::String> object. The
C<assert_StrObj> function can be used to throw an exception if the argument can
not be validated. The C<is_StrObj> function can be used to return true or false if
the argument can not be validated.

=cut

=type StrObject

  has data => (
    is  => 'rw',
    isa => StrObject,
  );

The StrObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::String> object. The
C<assert_StrObject> function can be used to throw an exception if the argument can
not be validated. The C<is_StrObject> function can be used to return true or false
if the argument can not be validated.

=cut

=type StrictNum

  has data => (
    is  => 'rw',
    isa => StrictNum,
  );

The StrictNum type constraint is provided by the L<Types::Standard> library.
Please see that documentation for more information. The C<assert_StrictNum
function> can be used to throw an exception if the argument can not be
validated. The C<is_StrictNum> function can be used to return true or false if the
argument can not be validated.

=cut

=type StringObj

  has data => (
    is  => 'rw',
    isa => StringObj,
  );

The StringObj type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::String> object. The
C<assert_StringObj> function can be used to throw an exception if the argument can
not be validated. The C<is_StringObj> function can be used to return true or false
if the argument can not be validated.

=cut

=type StringObject

  has data => (
    is  => 'rw',
    isa => StringObject,
  );

The StringObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::String> object. The
C<assert_StringObject> function can be used to throw an exception if the argument
can not be validated. The C<is_StringObject> function can be used to return true
or false if the argument can not be validated.

=cut

=type StrongPassword

  has data => (
    is  => 'rw',
    isa => StrongPassword,
  );

The StrongPassword type constraint is provided by the L<Types::Common::String>
library. Please see that documentation for more information. The
C<assert_StrongPassword> function can be used to throw an exception if the
argument can not be validated. The C<is_StrongPassword> function can be used to
return true or false if the argument can not be validated.

=cut

=type Tied

  has data => (
    is  => 'rw',
    isa => Tied['MyClass'],
  );

The Tied type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Tied> function can be
used to throw an exception if the argument can not be validated. The C<is_Tied>
function can be used to return true or false if the argument can not be
validated.

=cut

=type Tuple

  has data => (
    is  => 'rw',
    isa => Tuple[Int, Str, Str],
  );

The Tuple type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Tuple> function can be
used to throw an exception if the argument can not be validated. The C<is_Tuple>
function can be used to return true or false if the argument can not be
validated.

=cut

=type Undef

  has data => (
    is  => 'rw',
    isa => Undef,
  );

The Undef type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Undef> function can be
used to throw an exception if the argument can not be validated. The C<is_Undef>
function can be used to return true or false if the argument can not be
validated.

=cut

=type UndefObj

  has data => (
    is  => 'rw',
    isa => UndefObj,
  );

The UndefObj type constraint is provided by this library and accepts any object
that is, or is derived from, a L<Data::Object::Undef> object. The
C<assert_UndefObj> function can be used to throw an exception if the argument can
not be validated. The C<is_UndefObj> function can be used to return true or false
if the argument can not be validated.

=cut

=type UndefObject

  has data => (
    is  => 'rw',
    isa => UndefObject,
  );

The UndefObject type constraint is provided by this library and accepts any
object that is, or is derived from, a L<Data::Object::Undef> object. The
C<assert_UndefObject> function can be used to throw an exception if the argument
can not be validated. The C<is_UndefObject> function can be used to return true or
false if the argument can not be validated.

=cut

=type UpperCaseSimpleStr

  has data => (
    is  => 'rw',
    isa => UpperCaseSimpleStr,
  );

The UpperCaseSimpleStr type constraint is provided by the
L<Types::Common::String> library. Please see that documentation for more The
C<assert_UpperCaseSimpleStr> function can be used to throw an exception if the
argument can not be validated. The C<is_UpperCaseSimpleStr> function can be used
to return true or false if the argument can not be validated.
information.

=cut

=type UpperCaseStr

  has data => (
    is  => 'rw',
    isa => UpperCaseStr,
  );

The UpperCaseStr type constraint is provided by the L<Types::Common::String>
library. Please see that documentation for more information. The C<assert_type
function> can be used to throw an exception if the argument can not be
validated. The C<is_type> function can be used to return true or false if the
argument can not be validated.

=cut

=type Value

  has data => (
    is  => 'rw',
    isa => Value,
  );

The Value type constraint is provided by the L<Types::Standard> library. Please
see that documentation for more information. The C<assert_Value> function can be
used to throw an exception if the argument can not be validated. The C<is_Value>
function can be used to return true or false if the argument can not be
validated.

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
