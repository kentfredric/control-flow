package Control::Flow::Simple;
$Control::Flow::Simple::VERSION = '0.001000';
# ABSTRACT: A simple way of making flow objects

use Moose;

has flow => (
  isa => 'CodeRef',
  is => 'ro',
  required => 1,
);

with 'Control::Flow';

__PACKAGE__->meta->make_immutable;

__END__

=pod

=encoding UTF-8

=head1 NAME

Control::Flow::Simple - A simple way of making flow objects

=head1 VERSION

version 0.001000

=head1 SYNOPSIS

    use Control::Flow::Simple;
    my $flow = Control::Flow::Simple->new(flow => sub {
      my ($self,$value) = @_;
      $self->divert($value ? "yes" : "no");
    });
    $flow->hook("yes", sub { print "yes"; });
    $flow->hook("no", sub { print "no"; });
    $flow->flow(1); # prints "yes"
    $flow->flow(0); # prints "no"

=head1 AUTHORS

=over 4

=item *

James Laver <james.laver@gmail.com>

=item *

Kent Fredric <kentnl@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by James Laver.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut
