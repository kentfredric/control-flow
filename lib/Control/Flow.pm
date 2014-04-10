package Control::Flow;
$Control::Flow::VERSION = '0.001000';
# ABSTRACT: Flowchart-based programming

our $AUTHORITY = 'cpan:ELPENGUIN'; # AUTHORITY

use Moose::Role;
use Set::Scalar;

requires 'flow';

has _tags => (
  isa => 'HashRef',
  is => 'ro',
  default => sub {+{}},
  traits => ['Hash'],
  handles => {
    _set_tag => 'set',
    _get_tag => 'get',
    _tag_keys => 'keys',
  },
);

sub hook {
  my ($self,$tag,$hook) = @_;
  $self->_set_tag($tag,$hook);
}

sub divert {
  my ($self, $tag, @arguments) = @_;
  if (my $t = $self->_get_tag($tag)) {
    $t->(@arguments);
  }
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Control::Flow - Flowchart-based programming

=head1 VERSION

version 0.001000

=head1 SYNOPSIS

Constructs a flowchart of operations for flowchart-based programming.

    package Acme::Flowchart::Conditional;
    use Moose;
        with 'Control::Flow';

    sub flow {
      my ($self,$value) = @_;
      $self->divert( $value ? "yes" : "no" );
    }

    package main;

    my $flow = Acme::Flowchart::Conditional->new;
    $flow->hook("yes", sub { print "Yes"; });
    $flow->hook("no", sub { print "No"; });
    $flow->flow(1); # Prints "Yes";
    $flow->flow(0); # Prints "No";

=head1 WHY?

Flowchart based programming is starting to get interesting. This modules
provides a ground for experimentation. There's more to it than meets the eye.

See L<Control::Flow::Declarative>, L<Control::Flow::Declarative::Strict>

=head1 AUTHORS

=over 4

=item *

James Laver <james.laver@gmail.com>

=item *

Kent Fredric <kentnl@cpan.org>

=back

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Perldoc

You can find documentation for this module with the perldoc command.

  perldoc Control::Flow

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

MetaCPAN

A modern, open-source CPAN search engine, useful to view POD in HTML format.

L<http://metacpan.org/release/Control-Flow>

=item *

Search CPAN

The default CPAN search engine, useful to view POD in HTML format.

L<http://search.cpan.org/dist/Control-Flow>

=item *

RT: CPAN's Bug Tracker

The RT ( Request Tracker ) website is the default bug/issue tracking system for CPAN.

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Control-Flow>

=item *

AnnoCPAN

The AnnoCPAN is a website that allows community annotations of Perl module documentation.

L<http://annocpan.org/dist/Control-Flow>

=item *

CPAN Ratings

The CPAN Ratings is a website that allows community ratings and reviews of Perl modules.

L<http://cpanratings.perl.org/d/Control-Flow>

=item *

CPAN Forum

The CPAN Forum is a web forum for discussing Perl modules.

L<http://cpanforum.com/dist/Control-Flow>

=item *

CPANTS

The CPANTS is a website that analyzes the Kwalitee ( code metrics ) of a distribution.

L<http://cpants.perl.org/dist/overview/Control-Flow>

=item *

CPAN Testers

The CPAN Testers is a network of smokers who run automated tests on uploaded CPAN distributions.

L<http://www.cpantesters.org/distro/C/Control-Flow>

=item *

CPAN Testers Matrix

The CPAN Testers Matrix is a website that provides a visual overview of the test results for a distribution on various Perls/platforms.

L<http://matrix.cpantesters.org/?dist=Control-Flow>

=item *

CPAN Testers Dependencies

The CPAN Testers Dependencies is a website that shows a chart of the test results of all dependencies for a distribution.

L<http://deps.cpantesters.org/?module=Control::Flow>

=back

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-control-flow at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Control-Flow>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

L<https://github.com/kentfredric/control-flow>

  git clone https://github.com/kentfredric/control-flow.git

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by James Laver.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut
