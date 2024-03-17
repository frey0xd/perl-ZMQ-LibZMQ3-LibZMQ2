use strict;
use warnings;
use Test::More;
use File::Temp;
use ZMQ::LibZMQ3::LibZMQ2;
use ZMQ::Constants ':v2.1.11', qw(ZMQ_REP ZMQ_REQ);

my $path = File::Temp->new(UNLINK => 1)->filename;

# Test ZMQ modules
use_ok "ZMQ::LibZMQ3::LibZMQ2";
use_ok "ZMQ::Constants", ":v2.1.11", qw(ZMQ_REP ZMQ_REQ);

my $pid = fork();
if (not defined $pid) {
    die "Could not fork: $!";
} elsif ($pid == 0) {
    my $ctxt = zmq_init();
    my $child = zmq_socket($ctxt, ZMQ_REQ );
    zmq_connect( $child, "ipc://$path" );
    zmq_send( $child, "Hello from $$" );
    exit 0;
} else {
    my $ctxt = zmq_init();
    my $parent_sock = zmq_socket( $ctxt, ZMQ_REP);
    zmq_bind( $parent_sock, "ipc://$path" );
    my $msg = zmq_recv( $parent_sock );
    my $data = zmq_msg_data($msg);
    is($data, "Hello from $pid", "message is the expected message");
    waitpid $pid, 0;
}

unlink $path;

done_testing;
