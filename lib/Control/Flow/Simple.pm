package Control::Flow::Simple;

# ABSTRACT: A simple way of making flow objects

# AUTHORITY

use Moose;

has flow => (
  isa => 'CodeRef',
  is => 'ro',
  required => 1,
);

with 'Control::Flow';

__PACKAGE__->meta->make_immutable;
__END__
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

=cut   