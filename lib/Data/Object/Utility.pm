package Data::Object::Utility;

use 5.014;

use strict;
use warnings;

use Scalar::Util ();

# VERSION

# FUNCTIONS

sub TypeAny {
  require Data::Object::Any;

  my $class = 'Data::Object::Any';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeArray {
  require Data::Object::Array;

  my $class = 'Data::Object::Array';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeCode {
  require Data::Object::Code;

  my $class = 'Data::Object::Code';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeData {
  require Data::Object::Data;

  my $class = 'Data::Object::Data';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeDispatch {
  require Data::Object::Dispatch;

  my $class = 'Data::Object::Dispatch';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeException {
  require Data::Object::Exception;

  my $class = 'Data::Object::Exception';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeFloat {
  require Data::Object::Float;

  my $class = 'Data::Object::Float';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeHash {
  require Data::Object::Hash;

  my $class = 'Data::Object::Hash';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeInteger {
  require Data::Object::Integer;

  my $class = 'Data::Object::Integer';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeNumber {
  require Data::Object::Number;

  my $class = 'Data::Object::Number';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeRegexp {
  require Data::Object::Regexp;

  my $class = 'Data::Object::Regexp';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeScalar {
  require Data::Object::Scalar;

  my $class = 'Data::Object::Scalar';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeSpace {
  require Data::Object::Space;

  my $class = 'Data::Object::Space';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeString {
  require Data::Object::String;

  my $class = 'Data::Object::String';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

sub TypeUndef {
  require Data::Object::Undef;

  my $class = 'Data::Object::Undef';
  my $point = $class->can('new');

  unshift @_, $class and goto $point;
}

# DEDUCERS

sub Deduce {
  my ($data) = @_;

  return TypeUndef($data) if not(defined($data));
  return DeduceBlessed($data) if Scalar::Util::blessed($data);
  return DeduceDefined($data);
}

sub DeduceDefined {
  my ($data) = @_;

  return DeduceReferences($data) if ref($data);
  return DeduceNumberlike($data) if Scalar::Util::looks_like_number($data);
  return DeduceStringLike($data);
}

sub DeduceBlessed {
  my ($data) = @_;

  return TypeRegexp($data) if $data->isa('Regexp');
  return $data;
}

sub DeduceReferences {
  my ($data) = @_;

  return TypeArray($data) if 'ARRAY' eq ref $data;
  return TypeCode($data) if 'CODE' eq ref $data;
  return TypeHash($data) if 'HASH' eq ref $data;
  return TypeScalar($data); # glob, etc
}

sub DeduceNumberlike {
  my ($data) = @_;

  return TypeFloat($data) if $data =~ /\./;
  return TypeNumber($data) if $data =~ /^\d[_\d]*$/;
  return TypeInteger($data);
}

sub DeduceStringLike {
  my ($data) = @_;

  return TypeString($data);
}

sub DeduceDeep {
  my @data = map Deduce($_), @_;

  for my $data (@data) {
    my $type = TypeName($data);

    if ($type and $type eq 'HASH') {
      for my $i (keys %$data) {
        my $val = $data->{$i};
        $data->{$i} = ref($val) ? DeduceDeep($val) : Deduce($val);
      }
    }
    if ($type and $type eq 'ARRAY') {
      for (my $i = 0; $i < @$data; $i++) {
        my $val = $data->[$i];
        $data->[$i] = ref($val) ? DeduceDeep($val) : Deduce($val);
      }
    }
  }

  return wantarray ? (@data) : $data[0];
}

sub TypeName {
  my ($data) = (Deduce($_[0]));

  return "ANY" if $data->isa("Data::Object::Any");
  return "ARRAY" if $data->isa("Data::Object::Array");
  return "HASH" if $data->isa("Data::Object::Hash");
  return "CODE" if $data->isa("Data::Object::Code");
  return "FLOAT" if $data->isa("Data::Object::Float");
  return "NUMBER" if $data->isa("Data::Object::Number");
  return "INTEGER" if $data->isa("Data::Object::Integer");
  return "STRING" if $data->isa("Data::Object::String");
  return "SCALAR" if $data->isa("Data::Object::Scalar");
  return "REGEXP" if $data->isa("Data::Object::Regexp");
  return "UNDEF" if $data->isa("Data::Object::Undef");

  return undef;
}

# DETRACTORS

sub Detract {
  my ($data) = (Deduce($_[0]));

  my $type = TypeName($data);

INSPECT:
  return $data unless $type;

  return [@$data] if $type eq 'ARRAY';
  return {%$data} if $type eq 'HASH';
  return $$data if $type eq 'REGEXP';
  return $$data if $type eq 'FLOAT';
  return $$data if $type eq 'NUMBER';
  return $$data if $type eq 'INTEGER';
  return $$data if $type eq 'STRING';
  return undef  if $type eq 'UNDEF';

  if ($type eq 'ANY' or $type eq 'SCALAR') {
    $type = Scalar::Util::reftype($data) // '';

    return [@$data] if $type eq 'ARRAY';
    return {%$data} if $type eq 'HASH';
    return $$data if $type eq 'FLOAT';
    return $$data if $type eq 'INTEGER';
    return $$data if $type eq 'NUMBER';
    return $$data if $type eq 'REGEXP';
    return $$data if $type eq 'SCALAR';
    return $$data if $type eq 'STRING';
    return undef  if $type eq 'UNDEF';

    if ($type eq 'REF') {
      $type = TypeName($data = $$data) and goto INSPECT;
    }
  }

  if ($type eq 'CODE') {
    return sub { goto $data };
  }

  return undef;
}

sub DetractDeep {
  my @data = map Detract($_), @_;

  for my $data (@data) {
    if ($data and 'HASH' eq ref $data) {
      for my $i (keys %$data) {
        my $val = $data->{$i};
        $data->{$i} = ref($val) ? DetractDeep($val) : Detract($val);
      }
    }
    if ($data and 'ARRAY' eq ref $data) {
      for (my $i = 0; $i < @$data; $i++) {
        my $val = $data->[$i];
        $data->[$i] = ref($val) ? DetractDeep($val) : Detract($val);
      }
    }
  }

  return wantarray ? (@data) : $data[0];
}

1;
