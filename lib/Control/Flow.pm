package Control::Flow;

# ABSTRACT: Flowchart-based programming

# AUTHORITY

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

=method C<hook>

  $flow->hook( $tag, $hook );

=cut

sub hook {
  my ($self,$tag,$hook) = @_;
  $self->_set_tag($tag,$hook);
}

=method C<divert>

  $flow->divert( $tag, @arguments );

=cut

sub divert {
  my ($self, $tag, @arguments) = @_;
  if (my $t = $self->_get_tag($tag)) {
    $t->(@arguments);
  }
}

1;
__END__

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

