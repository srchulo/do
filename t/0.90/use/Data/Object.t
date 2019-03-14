use 5.014;

use strict;
use warnings;

use Test::More;

=name

Data::Object

=abstract

Modern Perl Development Framework and Standard Library

=synopsis

  use Data::Object;

  fun hello_world($name) {
    say "Hello, $name.";
  }

=description

Data-Object is a robust development framework for modern Perl development,
embracing Perl's multi-paradigm programming nature, flexibility and vast
ecosystem that millions of engineers already know and love.

This framework aims to provide a standardized and cohesive set of classes,
types, objects, functions, patterns, and tools for jump-starting application
development with modern conventions and best practices.

The power of this framework comes from the extendable (yet fully optional) type
library which is integrated into the object system and type-constrainable
subroutine signatures (supporting functions, methods and method modifiers). We
also provide classes which wrap Perl 5 native data types and provides methods
for operating on the data.

Contrary to popular opinion, modern Perl programming can be extremely
structured and quite beautiful, leveraging many advanced concepts found on
other languages, and some which aren't. Abilities like method modification
(augmenting), reflection, advanced object-orientation, type-constrainable
object attributes, type-constrainable subroutine signatures (with named and
positional arguments), as well roles (similar to mixins or interfaces in other
languages).

=installation

If you have cpanm, you only need one line:

  $ cpanm -qn Data::Object

If you don't have cpanm, get it! It takes less than a minute, otherwise:

  $ curl -L https://cpanmin.us | perl - -qn Data::Object

Add C<Data::Object> to the list of dependencies in C<cpanfile>:

  requires "Data::Object" => "0.90"; # 0.90 or newer

If cpanm doesn't have permission to install modules to the current perl, it
will automatically set up and install to a local::lib in your home directory.
See the L<local::lib|local::lib> documentation for details on enabling it in
your environment. We recommend using a
L<Perlbrew|https://github.com/gugod/app-perlbrew> or
L<Plenv|https://github.com/tokuhirom/plenv> environment. These tools will help
you manage multiple perl installations in your C<$HOME> directory. They are
completely isolated perl installations.

=getting-started

This creates a class representing a person which greets another person.

  package Person;

  use Data::Object Class, App;

  has name => (
    is => 'ro',
    isa => 'Str'
  );

  method hello(Person $person) {
    return 'Hello '. $person->name .', How are you?';
  }

  1;

This creates a function that returns how one person greet another person.

  #!perl

  use Person;

  use Data::Object Core, App;

  fun greetings(Person $p1, Person $p2) {
    return $p1->hello($p2);
  }

  my $p1 = Person->new(name => 'Jane');
  my $p2 = Person->new(name => 'June');

  say(greetings($p1, $p2)); # Hey June

This demonstrates much of the power of this framework in one simple example. If
you're new to Perl, the code above creates a class with a single (read-only
string) attribute called C<name> and a single method called C<hello>, then
registers the class in a user-defined type-library called C<App> where all
user-defined type constraints will be stored and retrieved (and reified).

The class method takes a single argument which must be an instance of the class
being created. The C<main> program (namespace) initializes the framework and
specifies the user-defined type library to use in the creation of a single
function C<greetings> which takes two arguments which must both be instances of
the class we just created. It's important to note that in order for the code
above to execute, the C<App> type library must exist. This could be as simple
as:

  package App;

  use Type::Library -base;

  1;

That having been explained, it's also important to note that while this example
showcases much of what's possible with this framework, all of the
sophistication is totally optional.  For example, method and function
signatures are optionally typed, so the declarations would work just as well
without the types specified. In fact, you could then remove the C<App> type
library declarations from both packages and even resort rewriting the method
and function as plain-old Perl subroutines. This flexibility to be able to
enable more advanced capabilities is common in the Perl ecosystem and is one of
the things we love most. The wiring-up of things! If you're familiar with Perl,
this framework is in-part the wiring up of L<Moo> (with L<Moose> support),
L<Type::Tiny>, L<Function::Parameters>, L<Try::Tiny> and data objects in a
cooperative and cohesive way that feels like it's native to the language.

=package-class

  use Data::Object::Space;

  my $space = Data::Object::Space->new('data/object');

  "$space"
  # Data::Object

  $space->path;
  # Data/Object

  $space->file;
  # Data/Object.pm

  $space->children;
  # ['Data/Object/Array.pm', ...]

The package class, L<Data::Object::Space>, provides methods of loading,
blessing, inspecting, and otherwise operating on packages.

=type-system

  package Config;

  use Data::Object Class;

  has 'data' => (
    is  => 'ro',
    isa => 'HashRef',
    req => 1
  );

  method json() {
    return new_json;
  }

  method save(PathObj $path) {
    return $path->write($self->data->dump);
  }

  1;

The type system and core type library offered in
L<Data::Object::Config::Library> provide type constraints for the most common
types of objects and values. These type constraints can be declared in class
attribute declarations as well as in method and function signatures.

The type-constrainable aspects of the Data-Object framework are context-aware,
i.e. the framework provides mechanisms for mapping user-defined type libraries
to namespaces so that user-defined types can be used in type validation
alongside core types. This prevents any need to extend the core type library
and prevents type constraint naming collisions across applications.

=object-system

  package App::Person;

  use Data::Object Class, App;

  has 'fname';
  has 'lname';

  has 'parents' => (
    is  => 'ro',
    isa => 'Tuple[AppPerson, AppPerson]',
    lzy => 1
  );


The underlying object system uses L<Moo> which is a light-weight L<Moose>
compatible framework for declaring classes, attributes, and method-modifiers,
as well as constructing objects, with clear and concise syntax. Data-Object
takes this functionality further by providing an integrated type system and
syntactic sugar around the class attribute declaration.

=type-builder

  package App::Type::Label;

  use parent 'Data::Object::Type';

  sub name {
    return 'Label';
  }

  sub parent {
    return 'Str';
  }

  sub coercions {
    my $coercions = [];

    push @$coercions, 'Str', sub { shift =~ s/\W//gr };

    return $coercions;
  }

  sub validation {
    my ($self, $data) = @_;

    return if !$data;

    return $data !~ /\W/;
  }

  1;

The type system provided is based on the L<Type::Tiny> system and takes
advantage of many of the features and functions available, such as coercion and
parameterization. The L<Data::Object::Config::Library> library is itself a
L<Type::Library>, and extends the L<Types::Standard>, L<Types::TypeTiny>,
L<Types::Common::Numeric> and L<Types::Common::String> libraries, and provides
additional types based on the classes, roles and rules offered as part of this
framework.

Many of the Data-Object type constraints are defined via an abstract base
class, L<Data::Object::Type>, which makes the super-class a type-constraint
builder, which is then registered with the Data-Object type library. This base
class provides a pattern for easily defining type constraints with coercions
and which might be parameterized that can be registered in any L<Type::Library>
library.

=roles-and-rules

  package Persona;

  use Data::Object Rule;

  requires 'id';
  requires 'fname';
  requires 'lname';
  requires 'created';
  requires 'updated';

  around created() {
    # do something ...
    return $self->$orig;
  }

  around updated() {
    # do something ...
    return $self->$orig;
  }

  1;

Roles offer us a way to reuse behavior without relying on inheritance. Rules
are roles but meant to establish by convention the separation of interface
declaration and behavior abstraction, i.e. rules are where we put the
“interface” rules, and roles are where we put the behavior.

=singleton-support

  package App::Config;

  use Data::Object State;

  extends 'Config';

  has 'datastore';
  has 'environment';
  has 'servers';

  1;

Occasionally it makes sense to declare some persistent state and the
L<Data::Object::State> class allows you to do that with all of the features and
benefits of a L<Moo> or L<Moose> derived object.

=podish-parser

  package App::Command;

  use Data::Object Data;

  =help

  fetches results from the api

  =cut

  my $data = Data::Object::Data->new;

  my $help = $data->content('help');

  1;

The pod-ish parser, offered in L<Data::Object::Data>, allows you to parse files
and packages and extract pod-like sections of information. This is a powerful
ability that rethinks what, why and how we use POD (plain old documentation)
data, and opens up your application to make use of this data in cool new ways.

=dispatchers

  use Data::Object::Dispatch;

  my $package = 'Logger';

  my $dispatch1 = Data::Object::Dispatch->new($package);

  $dispatch1->call(@args);

  my $dispatch2 = Data::Object::Dispatch->new($package, 'log', time);

  $dispatch2->call('Something went wrong');

  # i.e. Logger::log(time, 'Something went wrong')

Dispatchers are basically closures which when called execute subroutines in a
package, and can be curried. This concept is often found in functional
programming and is extremely powerful in that it creates an inversion of
control by allowing the closure creator to decide how the call will be
executed. The L<Data::Object::Dispatch> class can be used directly or
subclassed to create sophisticated applications.

=function-signatures

  use Data::Object;

  fun output($string) {
    say $string;
  }

  fun collect(Any @args) {
    return (map do('dump', $_), @args);
  }

  output(collect(@data));

Everything offered by this framework is optional and one of its best features
is the type-constrainable method and function signatures which leverages the
core type library and can easily interoperate with a user-defined type library
(or libraries).

=caller-configuration

  package Authenticatable;

  use Data::Object Rule;

  package Authentication;

  use Data::Object Role;

  package User;

  use Data::Object Class;

  with 'Authentication';
  with 'Authenticatable';

It's an important and intentional design decision to make this framework highly
configurable. It's really Perlish that way. Using the L<do> and L<Data::Object>
modules is the entry point into this framework and is where the configuration
of the various features begins. The import process has been designed to be
idempotent, and declaring the use of the same module multiple times with
different parameters is encouraged.

=constructor-functions

  use Data::Object;

  my $file = do('path', 'dump.json');
  my $json = do('json' $file->slurp);

  say(do('dump', $json));

The constructor functions offered through L<Data::Object::Export>, when called,
return instances of the classes they're associated with. They are merely a
convenience and provide a way to quickly load a class and construct an object
at runtime. These functions can be proxied to by the special (albeit slightly
evil) C<do> function, which overloads the core “do” function. This
super-function is made available to every namespace where the Data-Object
framework is configured.

=data-type-objects

  use Data::Object::Code;

  # returns a code object
  my $code = Data::Object::Code->new(sub{ join ' ', @_ });

  # returns truthy
  $code->isa('Data::Object::Code');

  # returns a string object representing 'Hello World'
  my $string = $code->call('Hello', 'World');

  # returns a new string object
  $string = $string->split('')->reverse->join('')->uppercase;

  # returns a number object (returns truthy) and outputs "DLROW OLLEH"
  my $result = $string->say;

  # returns truthy
  $result->isa('Data::Object::Number');

This framework also provides classes which wrap Perl 5 native data types and
provides methods for operating on that data, e.g. L<Data::Object::Array>,
L<Data::Object::Code>, L<Data::Object::Hash>, and L<Data::Object::String>, to
name a few. These are referred to as the data type classes which construct data
objects.

=function-classes

  my $data = Data::Object::Array->new([1..4]);

  my $sets = [];

  my $func = Data::Object::Func::Array::EachNValues->new(
    arg1 => $data,
    arg2 => 2,
    arg3 => fun ($v1, $v2) { push $@sets, [$v1, $v2]; }
  );

  my $result = $func->execute;

Each data type class' methods correspond to a function class which encapsulates
the subroutine logic, enforces its signature, provides execution automation,
and establishes an architecture that's easy to evolve and maintain. These
classes provide the logic that gets executed whenever a method call is made on
a data object.

=standard-library

  # Data::Object::Any
  # Data::Object::Array
  # Data::Object::Class
  # Data::Object::Cli
  # Data::Object::Code
  # Data::Object::Config
  # Data::Object::Data
  # Data::Object::Dispatch
  # Data::Object::Exception
  # Data::Object::Float
  # Data::Object::Hash
  # Data::Object::Integer
  # Data::Object::Json
  # Data::Object::Kind
  # Data::Object::Number
  # Data::Object::Path
  # Data::Object::Regexp
  # Data::Object::Replace
  # Data::Object::Role
  # Data::Object::Rule
  # Data::Object::Scalar
  # Data::Object::Search
  # Data::Object::Space
  # Data::Object::State
  # Data::Object::String
  # Data::Object::Template
  # Data::Object::Type
  # Data::Object::Undef
  # Data::Object::Yaml
  # etc

The framework is meant to offer a kind-of standard library of functionality,
concepts, and patterns for developing modern Perl applications. Again,
everything provided is optional and has been designed to be configurable.

=cut

use_ok 'Data::Object';

ok 1 and done_testing;