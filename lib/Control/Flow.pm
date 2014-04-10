package Control::Flow;

use Moose::Role;
use Set::Scalar;

require 'flow';

has _tags => (
  isa => 'HashRef',
  is => 'ro',
  default => sub {+{}},
  traits => ['Hash'],
  handles => {
    _set_tag => 'set',
    _get_tag => 'get'
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

__END__
=head1 NAME

Control::Flow - Flowchart-based programming

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

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

=head1 AUTHOR

James Laver, C<< <james.laver at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-control-flow at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Control-Flow>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Control::Flow


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Control-Flow>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2014 James Laver.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut
