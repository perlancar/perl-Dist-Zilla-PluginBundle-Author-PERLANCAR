package Dist::Zilla::PluginBundle::Author::PERLANCAR::Task;

use strict;
use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

# AUTHORITY
# DATE
# DIST
# VERSION

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@Author::PERLANCAR',
        -remove => [qw/PodCoverageTests PodSyntaxTests PodWeaver EnsureSQLSchemaVersionedTest Prereqs::CheckCircular/],
    });

    $self->add_plugins(
        'TaskWeaver',
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like PERLANCAR when you build your task dists

=for Pod::Coverage ^(configure)$

=head1 SYNOPSIS

 # dist.ini
 [@Author::PERLANCAR::Task]

is equivalent to:

 [@Filter]
 bundle=@Author::PERLANCAR
 remove=PodCoverageTests
 remove=PodSyntaxTests
 remove=PodWeaver

 [TaskWeaver]


=head1 DESCRIPTION

=cut
