#!/bin/perl

=pod

The Weekly Challenge - 155
 - https://perlweeklychallenge.org/blog/perl-weekly-challenge-155/#TASK2

Author: Niels 'PerlBoy' van Dijke

TASK #2 › Pisano Period
Submitted by: Mohammad S Anwar

Write a script to find the period of the 3rd Pisano Period.

 || In number theory, the nth Pisano period, written as π(n), is the period
 ||  with which the sequence of Fibonacci numbers taken modulo n repeats.

The Fibonacci numbers are the numbers in the integer sequence:

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, ....

For any integer n, the sequence of Fibonacci numbers F(i) taken modulo n is 
periodic. The Pisano period, denoted π(n), is the value of the period of this 
sequence. For example, the sequence of Fibonacci numbers modulo 3 begins:

0, 1, 1, 2, 0, 2, 2, 1,
0, 1, 1, 2, 0, 2, 2, 1,
0, 1, 1, 2, 0, 2, 2, 1, ...

This sequence has period 8, so π(3) = 8.

=cut

use v5.16;

use strict;
use warnings;
use bigint;

# Prototype(s)
sub fib($);

my @fibMod;

my $N = shift // 3;

my $i = 0;
while(1) {
  foreach (0,1) {
    push(@fibMod, fib($i++) % $N);
  }
  # Split fibMod in two halves
  my @fModLh = @fibMod[0 .. int($i/2)-1];
  my @fModUh = @fibMod[int($i/2) .. $i-1];

  # Compare lower and upper half
  if (join('',@fModLh) eq join('',@fModUh)) {
    printf "%dth Pisano Period: %d (%s)\n", $N, scalar @fModLh, join(',',@fModLh);
    exit;
  }
}


sub fib($) {
  my ($n) = @_;
  state $f = [0,1];
  $f->[$n] //= fib($n-2) + fib($n-1);
  return $f->[$n];
}
