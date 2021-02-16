#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

foreach (['20:20', '08:20pm'],
         ['22:05', '10:05pm'],
         ['05:00', '05:00am'],
         ['11:55', '11:55am']) {
    is(t($_->[0]), $_->[1]);
    is(t($_->[1]), $_->[0]);
}

done_testing;

sub t {
    return
    sprintf("%02d:%02d%s",
    ($_[0] =~ /(\d+)?\:(\d+)\s?([ap]m)$/i)
    ?((uc($3) eq 'PM')?($1+12,$2,''):($1,$2,''))
    :(($_[0] =~ /(\d+)?\:(\d+)/) and (($1>12)?($1-12,$2,'pm'):($1,$2,'am')))
    );
}
