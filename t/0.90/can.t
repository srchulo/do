#!/usr/bin/env perl

use lib 't/lib';

use Do;
use Test::Dist;
use Test::More;

my $pod = Test::Dist->new;

for my $file (map $pod->file("$_"), @{$pod->paths}) {
  for my $name (@{$file->can_files}) {
    my $data = $file->parse($name);

    ok $data->content('name'), "$name has pod name section";
    ok $data->content('usage'), "$name has pod usage section";
    ok $data->content('description'), "$name has pod description section";
    ok $data->content('signature'), "$name has pod signature section";
    ok $data->content('type'), "$name has pod type section";
  }
}

ok 1 and done_testing;
