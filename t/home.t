#!/usr/bin/env perl

use Modern::Perl;
use Test::WWW::Mechanize::Mojo;

my $tester  = Test::Mojo->new();
my $mech    = Test::WWW::Mechanize::Mojo->new(tester => $tester);

$mech->mojo_app('after5detroit');
$mech->host('localhost:3000');

if ($mech->get_ok('/home')) {

    $mech->title_is('Home');
}
