package Data::Object::Library;

use 5.014;

use strict;
use warnings;

use base 'Type::Library';

use Scalar::Util ();
use Type::Coercion ();
use Type::Tiny ();
use Type::Utils ();
use Types::TypeTiny ();

# VERSION

Type::Utils::extends('Types::Standard');
Type::Utils::extends('Types::TypeTiny');
Type::Utils::extends('Types::Common::Numeric');
Type::Utils::extends('Types::Common::String');

# TYPES

RegisterAll(DoArgs());
RegisterAll(DoData());
RegisterAll(DoDumpable());
RegisterAll(DoArray());
RegisterAll(DoCli());
RegisterAll(DoCode());
RegisterAll(DoException());
RegisterAll(DoFloat());
RegisterAll(DoFunc());
RegisterAll(DoHash());
RegisterAll(DoImmutable());
RegisterAll(DoNumber());
RegisterAll(DoOpts());
RegisterAll(DoRegexp());
RegisterAll(DoReplace());
RegisterAll(DoScalar());
RegisterAll(DoSearch());
RegisterAll(DoSpace());
RegisterAll(DoStashable());
RegisterAll(DoState());
RegisterAll(DoString());
RegisterAll(DoStruct());
RegisterAll(DoThrowable());
RegisterAll(DoUndef());
RegisterAll(DoVars());

# FUNCTIONS

sub DoArgs {
  {
    name => 'DoArgs',
    aliases => [
      'ArgsObj',
      'ArgsObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Args');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoArray {
  {
    name => 'DoArray',
    aliases => [
      'ArrayObj',
      'ArrayObject'
    ],
    coercions => [
      'ArrayRef', sub {
        require Data::Object::Array;
        Data::Object::Array->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Array');
      return 1;
    },
    explaination => sub {
      my ($data, $type, $name) = @_;

      my $param = $type->parameters->[0];

      for my $i (0 .. $#$data) {
        next if $param->check($data->[$i]);

        my $indx = sprintf('%s->[%d]', $name, $i);
        my $desc = $param->validate_explain($data->[$i], $indx);
        my $text = '"%s" constrains each value in the array object with "%s"';

        return [sprintf($text, $type, $param), @{$desc}];
      }

      return;
    },
    parameterize_constraint => sub {
      my ($data, $type) = @_;

      $type->check($_) || return for @$data;

      return !!1;
    },
    parameterize_coercions => sub {
      my ($data, $type, $anon) = @_;

      my $coercions = [];

      push @$coercions, 'ArrayRef', sub {
        my $value = @_ ? $_[0] : $_;
        my $items = [];

        for (my $i = 0; $i < @$value; $i++) {
          return $value unless $anon->check($value->[$i]);
          $items->[$i] = $data->coerce($value->[$i]);
        }

        return $type->coerce($items);
      };

      return $coercions;
    },
    parent => 'Object'
  }
}

sub DoCli {
  {
    name => 'DoCli',
    aliases => [
      'CliObj',
      'CliObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Cli');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoCode {
  {
    name => 'DoCode',
    aliases => [
      'CodeObj',
      'CodeObject'
    ],
    coercions => [
      'CodeRef', sub {
        require Data::Object::Code;
        Data::Object::Code->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Code');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoData {
  {
    name => 'DoData',
    aliases => [
      'DataObj',
      'DataObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Data');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoDumpable {
  {
    name => 'DoDumpable',
    aliases => [
      'Dumpable'
    ],
    validation => sub {
      return 0 if !$_[0]->does('Data::Object::Role::Dumpable');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoException {
  {
    name => 'DoException',
    aliases => [
      'ExceptionObj',
      'ExceptionObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Exception');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoFloat {
  {
    name => 'DoFloat',
    aliases => [
      'FloatObj',
      'FloatObject'
    ],
    coercions => [
      'Str', sub {
        require Data::Object::Float;
        Data::Oject::Float->new($_[0]);
      },
      'Num', sub {
        require Data::Object::Float;
        Data::Oject::Float->new($_[0]);
      },
      'LaxNum', sub {
        require Data::Object::Float;
        Data::Oject::Float->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Float');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoFunc {
  {
    name => 'DoFunc',
    aliases => [
      'FuncObj',
      'FuncObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Func');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoHash {
  {
    name => 'DoHash',
    aliases => [
      'HashObj',
      'HashObject'
    ],
    coercions => [
      'HashRef', sub {
        require Data::Object::Hash;
        Data::Object::Hash->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Hash');
      return 1;
    },
    explaination => sub {
      my ($data, $type, $name) = @_;

      my $param = $type->parameters->[0];

      for my $k (sort keys %$data) {
        next if $param->check($data->{$k});

        my $indx = sprintf('%s->{%s}', $name, B::perlstring($k));
        my $desc = $param->validate_explain($data->{$k}, $indx);
        my $text = '"%s" constrains each value in the hash object with "%s"';

        return [sprintf($text, $type, $param), @{$desc}];
      }

      return;
    },
    parameterize_constraint => sub {
      my ($data, $type) = @_;

      $type->check($_) || return for values %$data;

      return !!1;
    },
    parameterize_coercions => sub {
      my ($data, $type, $anon) = @_;

      my $coercions = [];

      push @$coercions, 'HashRef', sub {
        my $value = @_ ? $_[0] : $_;
        my $items = {};

        for my $k (sort keys %$value) {
          return $value unless $anon->check($value->{$k});
          $items->{$k} = $data->coerce($value->{$k});
        }

        return $type->coerce($items);
      };

      return $coercions;
    },
    parent => 'Object'
  }
}

sub DoImmutable {
  {
    name => 'DoImmutable',
    aliases => [
      'Immutable'
    ],
    validation => sub {
      return 0 if !$_[0]->does('Data::Object::Role::Immutable');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoNumber {
  {
    name => 'DoNum',
    aliases => [
      'NumObj',
      'NumObject',
      'NumberObj',
      'NumberObject'
    ],
    coercions => [
      'Int', sub {
        require Data::Object::Number;
        Data::Object::Number->new($_[0]);
      },
      'Num', sub {
        require Data::Object::Number;
        Data::Object::Number->new($_[0]);
      },
      'LaxNum', sub {
        require Data::Object::Number;
        Data::Object::Number->new($_[0]);
      },
      'StrictNum', sub {
        require Data::Object::Number;
        Data::Object::Number->new($_[0]);
      },
      'Str', sub {
        require Data::Object::Number;
        Data::Object::Number->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Number');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoOpts {
  {
    name => 'DoOpts',
    aliases => [
      'OptsObj',
      'OptsObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Opts');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoRegexp {
  {
    name => 'DoRegexp',
    aliases => [
      'RegexpObj',
      'RegexpObject'
    ],
    coercions => [
      'RegexpRef', sub {
        require Data::Object::Regexp;
        Data::Object::Regexp->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Regexp');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoReplace {
  {
    name => 'DoReplace',
    aliases => [
      'ReplaceObj',
      'ReplaceObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Replace');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoScalar {
  {
    name => 'DoScalar',
    aliases => [
      'ScalarObj',
      'ScalarObject'
    ],
    coercions => [
      'ScalarRef', sub {
        require Data::Object::Scalar;
        Data::Object::Scalar->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Scalar');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoSearch {
  {
    name => 'DoSearch',
    aliases => [
      'SearchObj',
      'SearchObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Search');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoSpace {
  {
    name => 'DoSpace',
    aliases => [
      'SpaceObj',
      'SpaceObject'
    ],
    coercions => [
      'Str', sub {
        require Data::Object::Space;
        Data::Object::Space->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Space');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoStashable {
  {
    name => 'DoStashable',
    aliases => [
      'Stashable'
    ],
    validation => sub {
      return 0 if !$_[0]->does('Data::Object::Role::Stashable');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoState {
  {
    name => 'DoState',
    aliases => [
      'StateObj',
      'StateObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::State');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoString {
  {
    name => 'DoStr',
    aliases => [
      'StrObj',
      'StrObject',
      'StringObj',
      'StringObject'
    ],
    coercions => [
      'Str', sub {
        require Data::Object::String;
        Data::Object::String->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::String');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoStruct {
  {
    name => 'DoStruct',
    aliases => [
      'StructObj',
      'StructObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Struct');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoThrowable {
  {
    name => 'DoThrowable',
    aliases => [
      'Throwable'
    ],
    validation => sub {
      return 0 if !$_[0]->does('Data::Object::Role::Throwable');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoUndef {
  {
    name => 'DoUndef',
    aliases => [
      'UndefObj',
      'UndefObject'
    ],
    coercions => [
      'Undef', sub {
        require Data::Object::Undef;
        Data::Object::Undef->new($_[0]);
      }
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Undef');
      return 1;
    },
    parent => 'Object'
  }
}

sub DoVars {
  {
    name => 'DoVars',
    aliases => [
      'VarsObj',
      'VarsObject'
    ],
    validation => sub {
      return 0 if !$_[0]->isa('Data::Object::Vars');
      return 1;
    },
    parent => 'Object'
  }
}

sub Library {
  __PACKAGE__->meta;
}

sub Register {
  my ($type) = @_;

  my $library = Library();

  my $name = $type->{name};
  my $aliases = $type->{aliases};
  my $parent = $type->{parent};
  my $coercions = $type->{coercions};
  my $validation = $type->{validation};

  return if $library->get_type($name);

  my $tinytype = Type::Tiny->new(Options($type));

  if ($type->{coercions}) {
    my $coercions = $type->{coercions};

    for (my $i = 0; $i < @$coercions; $i+=2) {
      if (!ref($coercions->[$i])) {
        $coercions->[$i] = $library->get_type($coercions->[$i]);
      }
    }

    $tinytype->coercion->add_type_coercions(@$coercions);
  }

  $library->add_type($tinytype);

  return $tinytype;
}

sub Options {
  my ($type) = @_;

  my $library = Library();
  my %options;

  $options{name} = $type->{name};
  $options{parent} = $type->{parent};
  $options{constraint} = sub { $type->{validation}->(@_) };

  if ($type->{explaination}) {
    $options{deep_explanation} = sub {
      GenerateExplanation($type, @_)
    };
  }

  if ($type->{parameterize_coercions}) {
    $options{coercion_generator} = sub {
      GenerateCoercion($type, @_)
    };
  }

  if ($type->{parameterize_constraint}) {
    $options{constraint_generator} = sub {
      GenerateConstraint($type, @_)
    };
  }

  if (!ref($options{parent})) {
    $options{parent} = $library->get_type($options{parent});
  }

  return %options;
}

sub RegisterAll {
  my ($type) = @_;

  my $registered = Register($type);

  Register({%{$type}, name => $_, aliases => []}) for @{$type->{aliases}};

  return $registered;
}

sub GenerateCoercion {
  my ($type, @args) = @_;

  my ($type1, $xtype, $type2) = @args;

  my $library = Library();

  if (!$type2->has_coercion) {
    return $type1->coercion;
  }

  my $anon = $type2->coercion->_source_type_union;
  my $coercion = Type::Coercion->new(type_constraint => $xtype);
  my $generated = $type->{parameterize_coercions}->($type2, $type1, $anon);

  for (my $i = 0; $i < @$generated; $i+=2) {
    my $item = $generated->[$i];

    $generated->[$i] = $library->get_type($item) if !ref($item);
  }

  $coercion->add_type_coercions(@$generated);

  return $coercion;
}

sub GenerateConstraint {
  my ($type, @args) = @_;

  return $type->{validator} if !@args;

  my $sign = "@{[$type->{name}]}\[`a\]";
  my $text = "Parameter to $sign expected to be a type constraint";
  my @list = map Types::TypeTiny::to_TypeTiny($_), @args;

  for my $item (@list) {
    if ($item->isa('Type::Tiny')) {
      next;
    }
    if (!Types::TypeTiny::TypeTiny->check($item)) {
      Types::Standard::_croak("$text; got $item");
    }
  }

  return sub { my ($data) = @_; $type->{parameterize_constraint}->($data, @list) };
}

sub GenerateExplanation {
  my ($type, @args) = @_;

  return $type->{explaination}->($_[2], $_[1], $_[3]);
}

# ONE-OFFS

Type::Utils::declare('RegexpLike', Type::Utils::as(Object(), Type::Utils::where(sub {
  return !!re::is_regexp($_[0]) || (Scalar::Util::blessed($_[0]) &&
    ($_[0]->isa('Regexp') || $_[0]->isa('Data::Object::Regexp')));
})));

Type::Utils::declare('NumberLike', Type::Utils::as(StringLike(), Type::Utils::where(sub {
  return Scalar::Util::looks_like_number("$_[0]");
})));

1;
