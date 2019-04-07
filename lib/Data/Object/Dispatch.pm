package Data::Object::Dispatch;

use parent 'Data::Object::Code';

# BUILD

sub new {
  my ($class, $name, $func, @args) = @_;

  return if !$name;

  my $space = $class->space($name);

  my $curry = $func ? $space->cop($func, @args) : sub { $space->call(@_) };

  return bless $curry, $class;
}

# METHODS

1;
