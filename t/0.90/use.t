#!/usr/bin/env perl

use lib 't/lib';

use Do;
use Test::This;
use Test::More;

my $pod = Test::This->new;

for my $file (map $pod->file("$_"), @{$pod->paths}) {
  my $name = $file->use_file;

  my $exists = !! -f $name;
  ok $exists, "$name exists";

  next if !$exists;

  my $data = $file->parse($name);

  ok $data->content('name'), "$name has pod name section";
  ok $data->content('abstract'), "$name has pod abstract section";
  ok $data->content('synopsis'), "$name has pod synopsis section";
  ok $data->content('description'), "$name has pod description section";
}

ok 1 and done_testing;
