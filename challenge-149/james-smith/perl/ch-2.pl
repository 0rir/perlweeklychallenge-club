#!/usr/local/bin/perl

use strict;

use warnings;
use feature qw(say);
use Test::More;
use Time::HiRes qw(time);

my @MAP = ( 0..9,'A'..'Z' );

for my $N (2..15) {
  my $time = time;
  my $v = biggest_perfect_square($N);
  say sprintf '%2d v = %10d v^2 = %20d = %16s; TIME = %10.6f',
         $N, $v, $v*$v, baseN($v*$v,$N), time-$time;
}

## We brute force this - we start at the largest possible square.
## and work backwards - our guess at the largest is the square
## root of the largest possible value with $N digits or roughty
## $N**($N/2);

## Rather than generating a representation of the number we
## just look for repeated digits - if we find one we test the
## next number - note here we use the "next LABEL" to break
## out of both the while and the for loop

sub biggest_perfect_square {
  my $n = shift;
  O: for( my $t = int($n**($n/2)); $t; $t -- ) {
    my ($q,%seen) = $t**2;
    $seen{$q%$n}++?(next O):($q=int($q/$n)) while $q;
    return $t;
  }
}

## As we didn't generate earlier - to prove we have a
## candidate we convert the number into base $N...
## We use the same while loop as above to return the
## string.

sub baseN {
  my($o,$v,$n) = ('',@_);
  ($o,$v) = ( $MAP[$v%$n].$o, int ($v/$n) ) while $v;
  $o;
}
