#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Control::Flow' ) || print "Bail out!\n";
}

diag( "Testing Control::Flow $Control::Flow::VERSION, Perl $], $^X" );
