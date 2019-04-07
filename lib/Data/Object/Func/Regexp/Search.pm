package Data::Object::Func::Regexp::Search;

use Data::Object 'Class';

use Data::Object::Search;

extends 'Data::Object::Func::Regexp';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

has arg2 => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data, $string, $flags) = $self->unpack;

  my $captures;
  my @matches;

  my $result = "$data";
  my $op     = '$string =~ m/$result/';
  my $capt   = '$captures = (' . $op . ($flags // '') . ')';
  my $mtch   = '@matches  = ([@-], [@+], {%-})';
  my $expr   = join ';', $capt, $mtch;

  my $error = do { local $@; eval $expr; $@ };

  throw($error) if $error;

  return Data::Object::Search->new([
    $result,
    $string,
    $captures,
    @matches,
    $string
  ]);
}

sub mapping {
  return ('arg1', 'arg2');
}

1;
