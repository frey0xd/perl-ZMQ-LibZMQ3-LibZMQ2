#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'ZMQ::LibZMQ3::LibZMQ2' ) || print "Bail out!\n";
}

diag( "Testing ZMQ::LibZMQ3::LibZMQ2 $ZMQ::LibZMQ3::LibZMQ2::VERSION, Perl $], $^X" );
