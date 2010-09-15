package Moose::Meta::Method::Accessor::Native::Array::map;

use strict;
use warnings;

our $VERSION = '1.13';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use base 'Moose::Meta::Method::Accessor::Native::Array::Reader';

sub _inline_process_arguments {
    return 'my $func = shift;';
}

sub _inline_check_arguments {
    return
        q{die 'Must provide a code reference as an argument' unless ( ref $func || q{} ) eq 'CODE';};
}

sub _return_value {
    my $self        = shift;
    my $slot_access = shift;

    return "map { \$func->() } \@{ $slot_access }";
}

1;
