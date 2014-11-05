#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'ZMQ::LibZMQ2::LibZMQ3' ) || print "Bail out!\n";
}

diag( "Testing ZMQ::LibZMQ2::LibZMQ3 $ZMQ::LibZMQ2::LibZMQ3::VERSION, Perl $], $^X" );
