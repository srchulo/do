package Data::Object::Space;

use Carp;

use Data::Object::Class;

# VERSION

# BUILD

sub BUILD {
  my ($self, $data) = @_;

  my @attrs = qw(root parts type);

  for my $attr (grep { defined $data->{$_} } @attrs) {
    $self->{$attr} = $data->{$attr};
  }

  if (defined $data->{root}) {
    $self->{root} = $self->parse($data->{root});
  } else {
    $self->{root} = [];
  }

  if (defined $data->{parts}) {
    $self->{parts} = $self->parse($data->{parts});
  } else {
    $self->{parts} = [];
  }

  if (defined $self->{parts}->[-1]) {
    ($self->{parts}->[-1], $self->{type}) = split /\./, $self->{parts}->[-1];
  }

  unless (defined $self->{type}) {
    $self->{type} = $data->{type} || 'pm';
  }

  return $self;
}

sub BUILDARGS {
  my ($class, @args) = @_;

  return { @args < 2 ? ('parts', $args[0]) : @args };
}

# METHODS

sub id {
  my ($self) = @_;

  return join '_', split /::/, $self->name;
}

sub parse {
  my ($self, $space) = @_;

  if (! defined $space || ref $space) {
    return $space;
  }
  return [
    map ucfirst,
    map join('', map(ucfirst, split /[-_]/)),
    split /[^-_a-zA-Z0-9.]+/, $space
  ];
}

sub call {
  my ($self, $func, @args) = @_;

  my $class = $self->load;

  unless ($func) {
    croak(qq(Attempt to call undefined object method in package "$class"));
  }

  my $next = $class->can($func);

  unless ($next) {
    croak(qq(Can't locate object method "$func" via package "$class"));
  }

  @_ = @args; goto $next;
}

sub cop {
  my ($self, $func, @args) = @_;

  my $class = $self->load;

  unless ($func) {
    croak(qq(Attempt to cop undefined object method from package "$class"));
  }

  my $next = $class->can($func);

  unless ($next) {
    croak(qq(Can't locate object method "$func" via package "$class"));
  }

  my $code = sub { $next->(@args ? (@args, @_) : @_) };

  return $code;
}

sub bless {
  my ($self, $data) = @_;

  my $class = $self->load;

  return CORE::bless($data // {}, $self->name);
}

sub build {
  my ($self, @args) = @_;

  my $class = $self->load;

  return $self->call('new', $class, @args);
}

sub child {
  my ($self, @args) = @_;

  my (@root, @parts);

  if (defined $self->root) {
    @root = @{$self->root};
  }
  if (defined $self->parts) {
    @parts = @{$self->parts};
  }

  my $space = join '/', @args;
  my $class = ref $self || $self;

  my $type = $self->type;

  return $class->new(root => [@root, @parts], parts => $space, type => $type);
}

sub load {
  my ($self) = @_;

  my $class = $self->name;

  return $class if $self->{loaded};

  my $failed = !$class || $class !~ /^\w(?:[\w:']*\w)?$/;
  my $loaded;

  my $error = do {
    local $@;
    no strict 'refs';
    $loaded = !!$class->can('new');
    $loaded = !!$class->can('with') if !$loaded;
    $loaded = !!$class->can('import') if !$loaded;
    $loaded = eval "require $class; 1" if !$loaded;
    $@;
  } if !$failed;

  croak "Error attempting to load $class: $error"
    if $error
    or $failed
    or not $loaded;

  $self->{loaded} = 1;

  return $class;
}

sub used {
  my ($self) = @_;

  my $regexp = quotemeta $self->file;

  for my $item (keys %INC) {
    return [$item, $INC{$item}] if $item =~ /$regexp$/;
  }

  return undef;
}

sub parts {
  my ($self) = @_;

  return $self->{parts};
}

sub parent {
  my ($self) = @_;

  my (@root, @parts);

  if (defined $self->root) {
    @root = @{$self->root};
  }
  if (defined $self->parts) {
    @parts = @{$self->parts};
  }

  pop @parts if @parts > 1 || @root;

  push @parts, shift @root if !@parts;

  my $type = $self->type;

  my $class = ref $self || $self;

  return $class->new(root => \@root, parts => \@parts, type => $type);
}

sub sibling {
  my ($self, @args) = @_;

  my $space = join '/', @args;

  my $parts = $self->parse($space);

  my $sibling = $self->parent;

  push @{$sibling->{parts}}, @{$parts} if $parts;

  return $sibling;
}

sub append {
  my ($self, @args) = @_;

  my $space = join '/', @args;

  my $parts = $self->parse($space);

  push @{$self->{parts}}, @{$parts} if $parts;

  return $self;
}

sub prepend {
  my ($self, @args) = @_;

  my $space = join '/', @args;

  my $parts = $self->parse($space);

  unshift @{$self->{parts}}, @{$parts} if $parts;

  return $self;
}

sub base {
  my ($self) = @_;

  return $self->parts->[-1];
}

sub children {
  my ($self) = @_;

  my %list;
  my $path;
  my $type;

  $path = quotemeta $self->path;
  $type = quotemeta $self->type;

  my $regexp = qr/$path\/[^\/]+\.$type/;

  for my $item (keys %INC) {
    $list{$item}++ if $item =~ /$regexp$/;
  }

  my %seen;

  $path = $self->path;
  $type = $self->type;

  my $expand = join('.', join('/', $path, '*'), $type);

  for my $dir (@INC) {
    next if $seen{$dir}++;

    my $re = quotemeta $dir;

    map { s/^$re\///; $list{$_}++ } grep !$list{$_}, glob "$dir/$expand";
  }

  my $class = ref $self || $self;

  return [map $class->new($_), sort keys %list];
}

sub siblings {
  my ($self) = @_;

  my %list;
  my $path;
  my $type;

  my $parent = $self->parent;

  $path = quotemeta $parent->path;
  $type = quotemeta $parent->type;

  my $regexp = qr/$path\/[^\/]+\.$type/;

  for my $item (keys %INC) {
    $list{$item}++ if $item =~ /$regexp$/;
  }

  my %seen;

  $path = $parent->path;
  $type = $parent->type;

  my $expand = join('.', join('/', $path, '*'), $type);

  for my $dir (@INC) {
    next if $seen{$dir}++;

    my $re = quotemeta $dir;

    map { s/^$re\///; $list{$_}++ } grep !$list{$_}, glob "$dir/$expand";
  }

  my $class = ref $self || $self;

  return [map $class->new($_), sort keys %list];
}

sub name {
  my ($self) = @_;

  my (@root, @parts);

  if (defined $self->root) {
    @root = @{$self->root};
  }
  if (defined $self->parts) {
    @parts = @{$self->parts};
  }

  return join '::', @root, @parts;
}

sub root {
  my ($self) = @_;

  return $self->{root};
}

sub path {
  my ($self, $form, @args) = @_;

  my (@root, @parts, $type);

  if (defined $self->root) {
    @root = @{$self->root};
  }
  if (defined $self->parts) {
    @parts = @{$self->parts};
  }

  $form = '%s' if !defined $form;

  return sprintf $form, join('/', @root, @parts), @args;
}

sub file {
  my ($self, $form, @args) = @_;

  $form = '%s' if !defined $form;

  return sprintf $form, join('.', $self->path, $self->type), @args;
}

sub type {
  my ($self) = @_;

  return $self->{type};
}

sub variables {
  my ($self) = @_;

  my %seen;

  map $seen{$_}++, map @{$self->$_}, qw(
    scalars
    arrays
    hashes
  );

  return [sort keys %seen];
}

sub scalar {
  my ($self, $name) = @_;

  no strict 'refs';

  my $class = $self->name;

  return ${"${class}::${name}"};
}

sub scalars {
  my ($self) = @_;

  no strict 'refs';

  my $class = $self->name;

  my $scalars = [
    sort grep !!${"${class}::$_"},
    grep /^[_a-zA-Z]/, keys %{"${class}::"}
  ];

  return $scalars;
}

sub array {
  my ($self, $name) = @_;

  no strict 'refs';

  my $class = $self->name;

  return (@{"${class}::${name}"});
}

sub arrays {
  my ($self) = @_;

  no strict 'refs';

  my $class = $self->name;

  my $arrays = [
    sort grep !!@{"${class}::$_"},
    grep /^[_a-zA-Z]/, keys %{"${class}::"}
  ];

  return $arrays;
}

sub hash {
  my ($self, $name) = @_;

  no strict 'refs';

  my $class = $self->name;

  return (%{"${class}::${name}"});
}

sub hashes {
  my ($self) = @_;

  no strict 'refs';

  my $class = $self->name;

  my $hashes = [
    sort grep !!%{"${class}::$_"},
    grep /^[_a-zA-Z]/, keys %{"${class}::"}
  ];

  return $hashes;
}

sub routine {
  my ($self, $name) = @_;

  no strict 'refs';

  my $class = $self->name;

  return *{"${class}::${name}"}{"CODE"};
}

sub routines {
  my ($self) = @_;

  no strict 'refs';

  my $class = $self->name;

  my $routines = [
    sort grep *{"${class}::$_"}{"CODE"},
    grep /^[_a-zA-Z]/, keys %{"${class}::"}
  ];

  return $routines;
}

sub methods {
  my ($self) = @_;

  my @methods;

  no strict 'refs';

  require Function::Parameters::Info;

  for my $routine (@{$self->routines}) {
    my $code = $self->can($routine) or next;
    my $data = Function::Parameters::info($code);

    push @methods, $routine if $data && $data->invocant;
  }

  return [sort @methods];
}

sub functions {
  my ($self) = @_;

  my @functions;

  no strict 'refs';

  require Function::Parameters::Info;

  for my $routine (@{$self->routines}) {
    my $code = $self->can($routine) or next;
    my $data = Function::Parameters::info($code);

    push @functions, $routine if $data && !$data->invocant;
  }

  return [sort @functions];
}

1;
