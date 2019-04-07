package Data::Object::Func::Hash::Unfold;

use Data::Object 'Class';

extends 'Data::Object::Func::Hash';

# VERSION

# BUILD

has arg1 => (
  is => 'ro',
  isa => 'Object',
  req => 1
);

# METHODS

sub execute {
  my ($self) = @_;

  my ($data) = $self->unpack;

  my $store = {};

  for my $key (sort(keys(%$data))) {
    my $node  = $store;
    my @steps = split(/\./, $key);

    for (my $i = 0; $i < @steps; $i++) {
      my $last = $i == $#steps;
      my $step = $steps[$i];

      if (my @parts = $step =~ /^(\w*):(0|[1-9]\d*)$/) {
        $node = $node->{$parts[0]}[$parts[1]]
          = $last ? $data->{$key}
          : exists $node->{$parts[0]}[$parts[1]] ? $node->{$parts[0]}[$parts[1]]
          : {};
      } else {
        $node = $node->{$step}
          = $last ? $data->{$key} : exists $node->{$step} ? $node->{$step} : {};
      }
    }
  }

  return $store;
}

sub mapping {
  return ('arg1');
}

1;
