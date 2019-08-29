package Data::Object::Replace;

use 5.014;

use strict;
use warnings;

use overload (
  '""'     => 'data',
  '~~'     => 'data',
  'bool'   => 'data',
  'qr'     => 'regexp',
  '@{}'    => 'self',
  fallback => 1
);

use parent 'Data::Object::Array';

# VERSION

# METHODS

sub captures {
  my ($self) = @_;

  my $string = $self->initial;

  my $last_match_start = $self->last_match_start;
  my $last_match_end   = $self->last_match_end;

  my @captures;

  for (my $i = 1; $i < @$last_match_end; $i++) {
    my $start = $last_match_start->[$i] || 0;
    my $end   = $last_match_end->[$i]   || 0;

    push @captures, substr "$string", $start, $end - $start;
  }

  return $self->deduce([@captures]);
}

sub count {
  my ($self) = @_;

  return $self->deduce($self->[2]);
}

sub initial {
  my ($self) = @_;

  return $self->deduce($self->[6]);
}

sub last_match_end {
  my ($self) = @_;

  return $self->deduce($self->[4]);
}

sub last_match_start {
  my ($self) = @_;

  return $self->deduce($self->[3]);
}

sub named_captures {
  my ($self) = @_;

  return $self->deduce($self->[5]);
}

sub matched {
  my ($self) = @_;

  my $string = $self->initial;

  my $last_match_start = $self->last_match_start;
  my $last_match_end   = $self->last_match_end;

  my $start = $last_match_start->[0] || 0;
  my $end   = $last_match_end->[0]   || 0;

  return $self->deduce(substr "$string", $start, $end - $start);
}

sub prematched {
  my ($self) = @_;

  my $string = $self->initial;

  my $last_match_start = $self->last_match_start;
  my $last_match_end   = $self->last_match_end;

  my $start = $last_match_start->[0] || 0;
  my $end   = $last_match_end->[0]   || 0;

  return $self->deduce(substr "$string", 0, $start);
}

sub postmatched {
  my ($self) = @_;

  my $string = $self->initial;

  my $last_match_start = $self->last_match_start;
  my $last_match_end   = $self->last_match_end;

  my $start = $last_match_start->[0] || 0;
  my $end   = $last_match_end->[0]   || 0;

  return $self->deduce(substr "$string", $end);
}

sub regexp {
  my ($self) = @_;

  return $self->deduce($self->[0]);
}

sub string {
  my ($self) = @_;

  return $self->deduce($self->[1]);
}

1;
