package ZMQ::LibZMQ3::LibZMQ2;

use 5.006;
use strict;
use warnings FATAL => 'all';
use ZMQ::LibZMQ3;

=head1 NAME

ZMQ::LibZMQ3::LibZMQ2 - Seamlessly Run LibZMQ Progs against LibZMQ3

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

This provides an interface compatible with ZMQ::LibZMQ2, but runs against
ZMQ::LibZMQ3.  For more information and documentation, see ZMQ::LibZMQ2

=head1 EXPORT

=over

=item zmq_errno

=item zmq_strerror

=item zmq_init

=item zmq_socket

=item zmq_bind

=item zmq_connect

=item zmq_close

=item zmq_getsockopt

=item zmq_setsockopt

=item zmq_send

=item zmq_recv

=item zmq_msg_init

=item zmq_msg_init_data

=item zmq_msg_init_size

=item zmq_msg_copy

=item zmq_msg_move

=item zmq_msg_close

=item zmq_msg_poll

=item zmq_version

=item zmq_device

=item zmq_getsockopt_int

=item zmq_getsockopt_int64

=item zmq_getsockopt_string

=item zmq_getsockopt_uint64

=item zmq_setsockopt_int

=item zmq_setsockopt_int64

=item zmq_setsockopt_string

=item zmq_setsockopt_uint64

=back

=cut

use base qw(Exporter);
our @EXPORT = qw(
        zmq_errno zmq_strerror 
        zmq_init zmq_term zmq_socket zmq_bind zmq_connect zmq_close 
        zmq_getsockopt zmq_setsockopt 
        zmq_send zmq_recv 
        zmq_msg_init zmq_msg_init_data zmq_msg_init_size 
        zmq_msg_data zmq_msg_size
        zmq_msg_copy zmq_msg_move zmq_msg_close 
        zmq_poll zmq_version zmq_device
        zmq_setsockopt_int zmq_setsockopt_int64 zmq_setsockopt_string
        zmq_setsockopt_uint64 zmq_getsockopt_int zmq_getsockopt_int64
        zmq_getsockopt_string zmq_getsockopt_uintint64
);

# Function override map:
# libzmq2 => libzmq3
#
# if you need to skip, you can do
# 
# libzmq2 => 0 
# 
# and then define your own function
my %fmap = (
   zmq_send => 0,
   zmq_recv => 'zmq_recvmsg',
   zmq_poll => 0,
);

{ 
    no strict 'refs';
    no warnings 'once';
    my $pkg = __PACKAGE__;
    *{"${pkg}::$_->{export}"} = *{"ZMQ::LibZMQ3::$_->{import}"}
    for map { 
          my $target = $_;
          $target = $fmap{$_} if exists $fmap{$_};
          $target ? { import => $target, export => $_ } : ();
    } @EXPORT;
};

no warnings 'redefine';

sub zmq_poll {
    my $timeout = pop @_;
    push @_, $timeout / 1000;
    return ZMQ::LibZMQ3::zmq_poll(@_);
}

sub zmq_send {
    my $rv = ZMQ::LibZMQ3::zmq_sendmsg(@_) || 0;
    $rv == -1 ? -1 : 0;
}


=head1 AUTHOR

Binary.com, C<< <perl at binary.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-zmq-libzmq2-libzmq3 at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=ZMQ-LibZMQ2-LibZMQ3>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc ZMQ::LibZMQ2::LibZMQ3


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=ZMQ-LibZMQ2-LibZMQ3>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/ZMQ-LibZMQ2-LibZMQ3>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/ZMQ-LibZMQ2-LibZMQ3>

=item * Search CPAN

L<http://search.cpan.org/dist/ZMQ-LibZMQ2-LibZMQ3/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Binary.com.

This program is distributed under the (Revised) BSD License:
L<http://www.opensource.org/licenses/BSD-3-Clause>

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

* Neither the name of Binary.com's Organization
nor the names of its contributors may be used to endorse or promote
products derived from this software without specific prior written
permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=head2 TEST SUITE COPYRIGHT AND LICENSE

The Test Suite is copied from ZMQ::LibZMQ, is copyright Daisuke Maki 
<daisuke@endeworks.jp> and Steffen Mueller, <smueller@cpan.org>.

It is released uner the same terms as Perl itself.


=cut

1; # End of ZMQ::LibZMQ2::LibZMQ3
