package Data::Object::Library;

use base 'Type::Library';

use Type::Utils ();

use Data::Object::Type::Any;
use Data::Object::Type::Array;
use Data::Object::Type::Code;
use Data::Object::Type::Exception;
use Data::Object::Type::Float;
use Data::Object::Type::Func;
use Data::Object::Type::Hash;
use Data::Object::Type::Integer;
use Data::Object::Type::Number;
use Data::Object::Type::Regexp;
use Data::Object::Type::Replace;
use Data::Object::Type::Scalar;
use Data::Object::Type::Search;
use Data::Object::Type::Space;
use Data::Object::Type::String;
use Data::Object::Type::Undef;

# VERSION

Type::Utils::extends('Types::Standard');
Type::Utils::extends('Types::TypeTiny');
Type::Utils::extends('Types::Common::Numeric');
Type::Utils::extends('Types::Common::String');

# CUSTOM TYPE CONSTRAINT BUILDERS

register Data::Object::Type::Any;
register Data::Object::Type::Array;
register Data::Object::Type::Code;
register Data::Object::Type::Exception;
register Data::Object::Type::Float;
register Data::Object::Type::Func;
register Data::Object::Type::Hash;
register Data::Object::Type::Integer;
register Data::Object::Type::Number;
register Data::Object::Type::Regexp;
register Data::Object::Type::Replace;
register Data::Object::Type::Scalar;
register Data::Object::Type::Search;
register Data::Object::Type::Space;
register Data::Object::Type::String;
register Data::Object::Type::Undef;

# METHODS

1;
