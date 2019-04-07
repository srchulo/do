package Data::Object::Signatures;

use strict;
use warnings;

use Function::Parameters;

use Data::Object::Export 'namespace', 'reify';

# VERSION

# BUILD

sub import {
  return Function::Parameters->import(settings(@_));
}

sub settings {
  my ($class, @args) = @_;

  # reifier config
  my $caller = caller(1);
  my @config = ($class, sub { unshift @_, $caller; goto \&reify });

  # for backwards compat
  @args = grep !/^:/, @args;
  namespace($caller, pop(@args)) if @args;

  # keyword config
  my %settings;

  %settings = (func_settings(@config), %settings);
  %settings = (meth_settings(@config), %settings);
  %settings = (befr_settings(@config), %settings);
  %settings = (aftr_settings(@config), %settings);
  %settings = (arnd_settings(@config), %settings);

  return {%settings};
}

sub func_settings {
  my ($class, $reifier) = @_;

  return (fun => {
    check_argument_count => 0, # for backwards compat :(
    check_argument_types => 1,
    default_arguments    => 1,
    defaults             => 'function',
    invocant             => 1,
    name                 => 'optional',
    named_parameters     => 1,
    reify_type           => $reifier,
    runtime              => 1,
    types                => 1,
  });
}

sub meth_settings {
  my ($class, $reifier) = @_;

  return (method => {
    attributes           => ':method',
    check_argument_count => 0, # for backwards compat :(
    check_argument_types => 1,
    default_arguments    => 1,
    defaults             => 'method',
    invocant             => 1,
    name                 => 'optional',
    named_parameters     => 1,
    reify_type           => $reifier,
    runtime              => 1,
    shift                => '$self',
    types                => 1,
  });
}

sub aftr_settings {
  my ($class, $reifier) = @_;

  return (after => {
    attributes           => ':method',
    check_argument_count => 0, # for backwards compat :(
    check_argument_types => 1,
    default_arguments    => 1,
    defaults             => 'method',
    install_sub          => 'after',
    invocant             => 1,
    name                 => 'required',
    named_parameters     => 1,
    reify_type           => $reifier,
    runtime              => 1,
    shift                => '$self',
    types                => 1,
  });
}

sub befr_settings {
  my ($class, $reifier) = @_;

  return (before => {
    attributes           => ':method',
    check_argument_count => 0, # for backwards compat :(
    check_argument_types => 1,
    default_arguments    => 1,
    defaults             => 'method',
    install_sub          => 'before',
    invocant             => 1,
    name                 => 'required',
    named_parameters     => 1,
    reify_type           => $reifier,
    runtime              => 1,
    shift                => '$self',
    types                => 1,
  });
}

sub arnd_settings {
  my ($class, $reifier) = @_;

  return (around => {
    attributes           => ':method',
    check_argument_count => 0, # for backwards compat :(
    check_argument_types => 1,
    default_arguments    => 1,
    defaults             => 'method',
    install_sub          => 'around',
    invocant             => 1,
    name                 => 'required',
    named_parameters     => 1,
    reify_type           => $reifier,
    runtime              => 1,
    shift                => ['$orig', '$self'],
    types                => 1,
  });
}

# METHODS

1;
