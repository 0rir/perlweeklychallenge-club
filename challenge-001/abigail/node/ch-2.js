#!/usr/local/bin/node

//
// See https://theweeklychallenge.org/blog/perl-weekly-challenge-001
//

//
// Run as: node ch-2.js < input-file
//

  require      ("fs")
. readFileSync (0)               // Read all.
. toString     ()                // Turn it into a string.
. split        ("\n")            // Split on newlines.
. filter       (_ => _ . length) // Filter out empty lines.
. map          (_ => {
    for (let i = 1; i <= +_; i ++) {
        console . log (i % 15 == 0 ? "fizzbuzz"
                     : i %  5 == 0 ?     "buzz"
                     : i %  3 == 0 ? "fizz"
                     : i)
    }
});
