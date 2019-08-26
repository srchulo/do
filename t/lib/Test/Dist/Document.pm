package Test::Dist::Document;

use Do 'Class';

use Test::Dist::Output;

has file => (
  is => 'ro',
  isa => 'InstanceOf["Test::Dist::File"]',
  req => 1
);

has name => (
  is => 'ro',
  isa => 'ArrayRef'
);

has abstract => (
  is => 'ro',
  isa => 'ArrayRef'
);

has synopsis => (
  is => 'ro',
  isa => 'ArrayRef'
);

has description => (
  is => 'ro',
  isa => 'ArrayRef'
);

has exports => (
  is => 'ro',
  isa => 'ArrayRef'
);

has functions => (
  is => 'ro',
  isa => 'ArrayRef'
);

has methods => (
  is => 'ro',
  isa => 'ArrayRef'
);

has routines => (
  is => 'ro',
  isa => 'ArrayRef'
);

method BUILD($args) {
  $self->construct;

  return $self;
}

method output() {
  return Test::Dist::Output->new(document => $self);
}

method construct() {
  my $list = $self->construct_sections;

  for my $item (@$list) {
    my $list;

    my $type = $item->{type};

    if ($type->[0] eq 'export') {
      $list = 'exports';
    }
    elsif ($type->[0] eq 'method') {
      $list = 'methods';
    }
    elsif ($type->[0] eq 'function') {
      $list = 'functions';
    }
    else {
      $list = 'routines';
    }

    push @{$self->{$list}}, $item;
  }

  my $data = $self->construct_headers;

  $self->{$_} = $data->{$_} for keys %$data;

  return $self;
}

method construct_data($file, @list) {
  my $data = {};
  my $pdoc = $self->file->parse($file);

  $data->{$_} = $pdoc->content($_) for @list;

  return $data;
}

method construct_headers() {
  my @list = qw(name abstract synopsis description);
  my $data = $self->construct_data($self->file->use_file, @list);

  return $data;
}

method construct_sections() {
  my $data = [map $self->construct_section("$_"), @{$self->file->can_files}];

  return $data;
}

method construct_section(Str $file) {
  my @list = qw(name usage description signature type);
  my $data = $self->construct_data($file, @list);

  return $data;
}

1;
