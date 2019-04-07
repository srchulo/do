package Data::Object::Type::Array;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoArray';
}

sub aliases {
  return ['ArrayObj', 'ArrayObject'];
}

sub coercions {
  return ['ArrayRef', sub { do('array', $_[0]) }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Array');

  return 1;
}

sub explaination {
  my ($self, $data, $type, $name) = @_;

  my $param = $type->parameters->[0];

  for my $i (0 .. $#$data) {
    next if $param->check($data->[$i]);

    my $indx = sprintf('%s->[%d]', $name, $i);
    my $desc = $param->validate_explain($data->[$i], $indx);
    my $text = '"%s" constrains each value in the array object with "%s"';

    return [sprintf($text, $type, $param), @{$desc}];
  }

  return;
}

sub parameterize {
  my ($self, $data, $type) = @_;

  $type->check($_) || return for @$data;

  return !!1;
}

sub parameterize_coercions {
  my ($self, $data, $type, $anon) = @_;

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
}

1;
