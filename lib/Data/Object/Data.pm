package Data::Object::Data;

use 5.014;

use strict;
use warnings;

use Moo;

use parent 'Data::Object::Base';

# VERSION

# BUILD

sub BUILD {
  my ($self, $data) = @_;

  my @attrs = qw(data file from);

  for my $attr (grep { defined $data->{$_} } @attrs) {
    $self->{$attr} = $data->{$attr};
  }

  unless (%$data) {
    $data->{from} = 'main';
  }

  if ($data->{file} && !$data->{data}) {
    $self->from_file($data->{file});
  }

  if ($data->{from} && !$data->{data}) {
    $self->from_data($data->{from});
  }

  return $self;
}

sub from_file {
  my ($self, $file) = @_;

  my $data = $self->file($file);

  $self->{file} = $file;
  $self->{data} = $self->parser(join("\n", @$data)) if @$data;

  return $self;
}

sub from_data {
  my ($self, $class) = @_;

  my $data = $self->data($class) or return;

  $self->{from} = $class;
  $self->{data} = $self->parser(join("\n", @$data)) if @$data;

  return $self;
}

# METHODS

sub file {
  my ($self, $file) = @_;

  open(my $handle, "<:encoding(UTF-8)", $file) or die "Error with $file: $!";

  my $data = [(<$handle>)];

  return $data;
}

sub data {
  my ($self, $class) = @_;

  my $handle = do { no strict 'refs'; \*{"${class}::DATA"} };

  fileno $handle or return [];

  # (no longer errors if DATA is missing)
  # fileno $handle or die "Error with $class: DATA not accessible";

  seek $handle, 0, 0;

  my $data = [(<$handle>)];

  return $data;
}

sub item {
  my ($self, $name) = @_;

  for my $item (@{$self->{data}}) {
    return $item if $item->{name} eq $name;
  }

  return;
}

sub list {
  my ($self, $name) = @_;

  return if !$name;

  my @list;

  for my $item (@{$self->{data}}) {
    push @list, $item if $item->{list} && $item->{list} eq $name;
  }

  return [sort { $a->{index} <=> $b->{index} } @list];
}

sub pluck {
  my ($self, $type, $name) = @_;

  return if !$name;
  return if !$type || ($type ne 'item' && $type ne 'list');

  my (@list, @copy);

  for my $item (@{$self->{data}}) {
    my $matched = 0;

    $matched = 1 if $type eq 'list' && $item->{list} && $item->{list} eq $name;
    $matched = 1 if $type eq 'item' && $item->{name} && $item->{name} eq $name;

    push @list, $item if $matched;
    push @copy, $item if !$matched;
  }

  $self->{data} = [sort { $a->{index} <=> $b->{index} } @copy];

  return $type eq 'name' ? $list[0] : [@list];
}

sub content {
  my ($self, $name) = @_;

  my $item = $self->item($name) or return;
  my $data = $item->{data};

  return $data;
}

sub contents {
  my ($self, $name) = @_;

  my $items = $self->list($name) or return;
  my $data = [map { $_->{data} } @$items];

  return $data;
}

sub parser {
  my ($self, $data) = @_;

  my @chunks = split /^=\s*(.+?)\s*\r?\n/m, $data;

  shift @chunks;

  my $items = [];

  while (my ($meta, $data) = splice @chunks, 0, 2) {
    next unless $meta && $data;
    next unless $meta ne 'cut';

    my @info = split /\s/, $meta, 2;

    my ($list, $name) = @info == 2 ? @info : (undef, @info);

    $data = [split /\n\n/, $data];

    my $item = { name => $name, data => $data, index => @$items + 1, list => $list };

    push @$items, $item;
  }

  return $items;
}

1;
