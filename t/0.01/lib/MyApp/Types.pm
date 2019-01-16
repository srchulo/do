package MyApp::Types;

use Type::Utils -all;

use parent 'Data::Object::Config::Type';

declare "AllCaps", as Data::Object::Config::Type::StrObj, where { uc("$_") eq "$_" };

coerce "AllCaps", from Data::Object::Config::Type::StrObj, via { uc("$_") };

1;
