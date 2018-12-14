use strict;
use warnings;
use Test::More;

use Data::Object::Role::Syntax ();

my @exports = qw(
  alt
  builder
  clearer
  coerce
  def
  default
  defaulter
  handles
  init_arg
  is
  isa
  lazy
  opt
  optional
  predicate
  reader
  req
  required
  ro
  rw
  trigger
  weak_ref
  writer
);

sub has {@_}

can_ok 'Data::Object::Role::Syntax', @exports;
is_deeply [@exports], [@Data::Object::Role::Syntax::EXPORT];

subtest 'test the alt function' => sub {
  is_deeply [Data::Object::Role::Syntax::alt('attr')], ['+attr',];
  is_deeply [Data::Object::Role::Syntax::alt('attr', 'is', 'ro')],
    ['+attr' => (is => 'ro'),];
};

subtest 'test the builder function' => sub {
  is_deeply [Data::Object::Role::Syntax::builder()], [builder => 1,];
  is_deeply [Data::Object::Role::Syntax::builder('_build_attr')],
    [builder => '_build_attr',];
};

subtest 'test the clearer function' => sub {
  is_deeply [Data::Object::Role::Syntax::clearer()], [clearer => 1,];
  is_deeply [Data::Object::Role::Syntax::clearer('_clear_attr')],
    [clearer => '_clear_attr',];
};

subtest 'test the coerce function' => sub {
  is_deeply [Data::Object::Role::Syntax::coerce()], [coerce => 1,];
};

subtest 'test the def function' => sub {
  is_deeply [Data::Object::Role::Syntax::def('attr', 1)],
    ['+attr' => (default => 1),];
  is_deeply [Data::Object::Role::Syntax::def('attr', 1, 'is', 'ro')],
    ['+attr' => (default => 1, is => 'ro'),];
};

subtest 'test the default function' => sub {
  is_deeply [Data::Object::Role::Syntax::default(undef)], [default => undef,];
  is_deeply [Data::Object::Role::Syntax::default('foobarbaz')],
    [default => 'foobarbaz',];
};

subtest 'test the defaulter function' => sub {
  is_deeply [Data::Object::Role::Syntax::defaulter], [defaulter => 1,];
};

subtest 'test the handles function' => sub {
  is_deeply [Data::Object::Role::Syntax::handles('SomeRole')],
    [handles => 'SomeRole',];
  is_deeply [Data::Object::Role::Syntax::handles(['foo', 'bar'])],
    [handles => ['foo', 'bar'],];
  is_deeply [Data::Object::Role::Syntax::handles({this => 'that'})],
    [handles => {this => 'that'},];
};

subtest 'test the init_arg function' => sub {
  is_deeply [Data::Object::Role::Syntax::init_arg('altattr')],
    [init_arg => 'altattr',];
};

subtest 'test the is function' => sub {
  is_deeply [Data::Object::Role::Syntax::is(1 .. 9)], [1 .. 9,];
};

subtest 'test the isa function' => sub {
  my $code = sub {1};
  is_deeply [Data::Object::Role::Syntax::isa($code)], [isa => $code,];
};

subtest 'test the lazy function' => sub {
  is_deeply [Data::Object::Role::Syntax::lazy()], [lazy => 1,];
};

subtest 'test the opt function' => sub {
  is_deeply [Data::Object::Role::Syntax::opt('attr')],
    ['+attr', required => 0,];
  my $code = sub {1};
  is_deeply [Data::Object::Role::Syntax::opt('attr', $code)],
    ['+attr', isa => $code, required => 0,];
  is_deeply [Data::Object::Role::Syntax::opt('attr', $code, is => 'ro')],
    ['+attr', isa => $code, is => 'ro', required => 0,];
};

subtest 'test the optional function' => sub {
  is_deeply [Data::Object::Role::Syntax::optional()], [required => 0,];
};

subtest 'test the predicate function' => sub {
  is_deeply [Data::Object::Role::Syntax::predicate()], [predicate => 1,];
  is_deeply [Data::Object::Role::Syntax::predicate('_has_attr')],
    [predicate => '_has_attr',];
};

subtest 'test the reader function' => sub {
  is_deeply [Data::Object::Role::Syntax::reader()], [reader => 1,];
  is_deeply [Data::Object::Role::Syntax::reader('_get_attr')],
    [reader => '_get_attr',];
};

subtest 'test the req function' => sub {
  is_deeply [Data::Object::Role::Syntax::req('attr')],
    ['+attr', required => 1,];
  my $code = sub {1};
  is_deeply [Data::Object::Role::Syntax::req('attr', $code)],
    ['+attr', isa => $code, required => 1,];
  is_deeply [Data::Object::Role::Syntax::req('attr', $code, is => 'ro')],
    ['+attr', isa => $code, is => 'ro', required => 1,];
};

subtest 'test the required function' => sub {
  is_deeply [Data::Object::Role::Syntax::required()], [required => 1,];
};

subtest 'test the ro function' => sub {
  is_deeply [Data::Object::Role::Syntax::ro()], [is => 'ro',];
};

subtest 'test the rw function' => sub {
  is_deeply [Data::Object::Role::Syntax::rw()], [is => 'rw',];
};

subtest 'test the trigger function' => sub {
  is_deeply [Data::Object::Role::Syntax::trigger()], [trigger => 1,];
  is_deeply [Data::Object::Role::Syntax::trigger('_trigger_attr')],
    [trigger => '_trigger_attr',];
};

subtest 'test the weak_ref function' => sub {
  is_deeply [Data::Object::Role::Syntax::weak_ref()], [weak_ref => 1,];
};

subtest 'test the writer function' => sub {
  is_deeply [Data::Object::Role::Syntax::writer()], [writer => 1,];
  is_deeply [Data::Object::Role::Syntax::writer('_set_writer')],
    [writer => '_set_writer',];
};

ok 1 and done_testing;
