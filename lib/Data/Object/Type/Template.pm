package Data::Object::Type::Template;

use strict;
use warnings;

use Data::Object::Export;

use parent 'Data::Object::Type';

# BUILD
# METHODS

sub name {
  return 'DoTemplate';
}

sub aliases {
  return ['TemplateObj', 'TemplateObject'];
}

sub validation {
  my ($self, $data) = @_;

  return 0 if !$data->isa('Data::Object::Template');

  return 1;
}

1;
