#!/usr/bin/env perl

use Modern::Perl;
use Path::Tiny;

@ARGV==1 && $ARGV[0]=~/^\d+$/ && $ARGV[0]>0
    or die "Usage: ",path($0)->basename," nr\n";
my $nr = sprintf("%03d", $ARGV[0]);

for my $dir (qw( 
			ada     
			awk     
			basic   
			bc      
			brainfuck
			c       
			cpp     
			d       
			forth   
			fortran 
			lua     
			pascal  
			perl    
			python  
			t 
			)) {
    path("challenge-$nr/paulo-custodio/$dir")->mkpath;
}
path("challenge-$nr/paulo-custodio/README")->spew("Solution by Paulo Custodio\n");
chdir("challenge-$nr/paulo-custodio");
system("bash");
