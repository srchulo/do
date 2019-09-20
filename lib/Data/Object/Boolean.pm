package Data::Object::Boolean;

use 5.014;

use strict;
use warnings;

use Scalar::Util ();

state $TrueVal = 1;
state $TrueRef = \$TrueVal;
state $TrueType = 'True';
state $True = bless $TrueRef;

state $FalseVal = 0;
state $FalseRef = \$FalseVal;
state $FalseType = 'False';
state $False = bless $FalseRef;

use overload (
  '""'     => sub{${$_[0]}},
  '!'      => sub{${$_[0]}?$False:$True},
  fallback => 1
);

# VERSION

# METHODS

sub new {
  IsTrue($_[1])
}

sub False {
  $False
}

sub True {
  $True
}

sub Type {
  if (not defined $_[0]) {
    return $FalseType;
  }

  if (not ref $_[0]) {
    return !!$_[0] ? $TrueType : $FalseType;
  }

  if (Scalar::Util::reftype($_[0]) eq 'SCALAR') {
    return ${$_[0]} ? $TrueType : $FalseType;
  }

  if (Scalar::Util::blessed($_[0])) {
    return $TrueType;
  }

  return !!$_[0] ? $TrueType : $FalseType;
}

sub IsTrue {
  Type($_[0]) eq $TrueType ? $True : $False
}

sub IsFalse {
  Type($_[0]) eq $FalseType ? $True : $False
}

sub TO_JSON {
  ${$_[0]} ? \1 : \0
}

1;
