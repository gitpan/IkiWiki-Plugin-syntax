#!/usr/bin/perl

use strict;
use warnings;

use Test::More qw(no_plan);

use lib qw(lib t/lib);
use IkiWiki q(2.0);

use MyTestTools qw(:css);

my $class = 'IkiWiki::Plugin::syntax::Simple';

use_ok($class);

my $engine = $class->new();

isa_ok($engine, $class );

my $source = <<'EOF';
/* This is a foo program */
int a = 3;
printf("%d\n",a);
EOF

my $output = $engine->syntax_highlight( language    => 'C',
                                        source      => $source,
                                        linenumbers => 1,
                                        bars        => 1, );

my $regex_ln = build_css_regex('synLineNumber','\d+');                                    
like($output, $regex_ln, "Source text with line numbers");

my $regex_bar = build_css_regex('synBar');
like($output, $regex_bar, "Source text with bar lines");

check_results( $output, 
            synBar          =>  2,
            synLineNumber   =>  3,
            synType         =>  0,
            synUnderlined   =>  0,
            synComment      =>  0,
            synConstant     =>  0,      );

