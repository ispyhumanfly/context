#!/usr/bin/env perl

use Modern::Perl;

use Test::More tests => 12;
use Test::Mojo;

my $t = Test::Mojo->new('After5');

# HTML/XML
$t->get_ok('/home')->status_is(200);

