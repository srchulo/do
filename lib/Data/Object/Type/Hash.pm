package Data::Object::Type::Hash;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# VERSION

# BUILD
# METHODS

sub name {
  return 'DoHash';
}

sub aliases {
  return ['HashObj', 'HashObject'];
}

sub coercions {
  return ['HashRef', sub { do('hash', $_[0]) }];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Hash');

  return 1;
}

sub explaination {
  my ($self, $data, $type, $name) = @_;

  my $param = $type->parameters->[0];

  for my $k (sort keys %$data) {
    next if $param->check($data->{$k});

    my $indx = sprintf('%s->{%s}', $name, B::perlstring($k));
    my $desc = $param->validate_explain($data->{$k}, $indx);
    my $text = '"%s" constrains each value in the hash object with "%s"';

    return [sprintf($text, $type, $param), @{$desc}];
  }

  return;
}

sub parameterize {
  my ($self, $data, $type) = @_;

  $type->check($_) || return for values %$data;

  return !!1;
}

sub parameterize_coercions {
  my ($self, $data, $type, $anon) = @_;

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
}

1;
