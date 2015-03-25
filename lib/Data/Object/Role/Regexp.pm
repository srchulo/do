# ABSTRACT: A Regexp Object Role for Perl 5
package Data::Object::Role::Regexp;

use 5.010;
use Moo::Role;

use Carp 'confess';

map with($_), our @ROLES = qw(
    Data::Object::Role::Defined
    Data::Object::Role::Detract
    Data::Object::Role::Output
    Data::Object::Role::Ref
);

# VERSION

sub search {
    my($self, $string, $flags) = @_;

    my $captures;
    my @matches;

    my $op   = '$string =~ m/$$self/';
    my $capt = '$captures = (' . $op . ($flags // '') . ')';
    my $mtch = '@matches  = ([@-], [@+], {%-})';
    my $expr = join ';', $capt, $mtch;

    my $error = do { local $@; eval $expr; $@ };
    confess $error if $error;

    return [$$self, $string, $captures, @matches, $string];
}

sub replace {
    my($self, $string, $replacement, $flags) = @_;

    my $captures;
    my @matches;

    my $op   = '$string =~ s/$$self/$replacement/';
    my $capt = '$captures = (' . $op . ($flags // '') . ')';
    my $mtch = '@matches  = ([@-], [@+], {%-})';
    my $expr = join ';', $capt, $mtch;

    my $initial = $string;

    my $error = do { local $@; eval $expr; $@ };
    confess $error if $error;

    return [$$self, $string, $captures, @matches, $initial];
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Data::Object::Role::Regexp;

=head1 DESCRIPTION

Data::Object::Role::Regexp provides functions for operating on Perl 5 regular
expressions.

=cut

=head1 SEE ALSO

=over 4

=item *

L<Data::Object::Role::Array>

=item *

L<Data::Object::Role::Code>

=item *

L<Data::Object::Role::Float>

=item *

L<Data::Object::Role::Hash>

=item *

L<Data::Object::Role::Integer>

=item *

L<Data::Object::Role::Number>

=item *

L<Data::Object::Role::Regexp>

=item *

L<Data::Object::Role::Scalar>

=item *

L<Data::Object::Role::String>

=item *

L<Data::Object::Role::Undef>

=item *

L<Data::Object::Role::Universal>

=item *

L<Data::Object::Autobox>

=back

=cut