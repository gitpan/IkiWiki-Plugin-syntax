#!/usr/bin/perl

use strict;
use warnings;

use lib qw(lib t/lib blib/lib);

use Test::More;

BEGIN {
    eval {
        require Test::Distribution;
    };

    if ($@) {
        plan skip_all => 'Test::Distribution not installed';
    }
    else {
        import Test::Distribution not => q(podcover);
    }
}


