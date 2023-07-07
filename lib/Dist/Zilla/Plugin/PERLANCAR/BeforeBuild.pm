package Dist::Zilla::Plugin::PERLANCAR::BeforeBuild;

use 5.010001;
use strict;
use warnings;

use Moose;
use namespace::autoclean;

use Module::Version 'get_version';

with (
    'Dist::Zilla::Role::BeforeBuild',
);

# AUTHORITY
# DATE
# DIST
# VERSION

sub before_build {
    my $self = shift;

    my %min_versions = (
        "CPAN::Meta::Prereqs" => "2.150006", # preserves x_* phases/rels
    );
    for (sort keys %min_versions) {
        my $min_v = $min_versions{$_};
        my $installed_v = get_version($_);
        if (version->parse($installed_v) < version->parse($min_v)) {
            die "$_ version must be >= $min_v";
        }
    }
}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: Do stuffs before building

=for Pod::Coverage .+

=head1 SYNOPSIS

In F<dist.ini>:

 [PERLANCAR::BeforeBuild]


=head1 DESCRIPTION

Currently what this does:

=over

=item * Ensure that the versions of some required modules are recent enough

=back

=cut
