package Data::Object::Type::Yaml;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoYaml';
}

sub aliases {
  return ['YamlObj', 'YamlObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Yaml');

  return 1;
}

1;
