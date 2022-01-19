#!/usr/local/bin/perl

use strict;

use warnings;
use feature qw(say);
use Benchmark qw(timethese cmpthese);

## Ubuntu supplies a number of different dictionaries
## I have installed all four of the english (UK)
## dictionaries that are available - a summary of the
## number of words is listed below. This does include
## a large number of real names and words containing
## hyphen's and apostrophies
##
##   Name:    # words # trimmed
##   -------  ------- ---------
##   small:    50,790    39,781
##   large:   166,828   113,695
##   huge:    344,861   245,593
##   insane:  654,299   427,891
##

#foreach (1..10) {
#say longest_u( '/usr/share/dict/british-english-small'  );
#say longest_u( '/usr/share/dict/british-english-large'  );
#say longest_u( '/usr/share/dict/british-english-huge'   );
#say longest_u( '/usr/share/dict/british-english-insane' );
#}
#
cmpthese( 10,{
  's' => sub {
say longest( '/usr/share/dict/british-english-small'  );
say longest( '/usr/share/dict/british-english-large'  );
say longest( '/usr/share/dict/british-english-huge'   );
say longest( '/usr/share/dict/british-english-insane' );
},
  'u' => sub {
say longest_u( '/usr/share/dict/british-english-small'  );
say longest_u( '/usr/share/dict/british-english-large'  );
say longest_u( '/usr/share/dict/british-english-huge'   );
say longest_u( '/usr/share/dict/british-english-insane' );
},
});
#say longest_no_comments( '/usr/share/dict/british-english-small'  );
#say longest_no_comments( '/usr/share/dict/british-english-large'  );
#say longest_no_comments( '/usr/share/dict/british-english-huge'   );
#say longest_no_comments( '/usr/share/dict/british-english-insane' );

sub longest_u {
  open my $fh, q(<), $_[0];
  my @max = (0);
     (chomp)         ## Remove newline character
  #&& !/\W/           ## Remove words with non-alpha chars
  && !/[^a-z]/       ## Remove words starting with a capital
  && ( $max[0] <= length $_ )
                     ## Remove words that are too short
  && ( $_ eq join q(), sort unpack '(A)*' )
                     ## Check the word is unchanged when the
                     ## letters are sorted
  && ( $max[0] == length $_
       ? ( push @max, $_ )
       : ( @max = (length $_, $_) )
     )
    ## If the word is the same length as the maximal word
    ## push it onto @max - so we store all the longest words
    ## with maximum length.
    ## If the word is longer than the max length (1st entry
    ## in @max - reset max to include the new max length and
    ## the word.
    while <$fh>;
  return "$_[0] > @max";
  ## Return the name of the file used, the size of the words
  ## and a complete list of the words of that length.
}

sub longest {
  open my $fh, q(<), $_[0];
  my @max = (0);
     (chomp)         ## Remove newline character
  #&& !/\W/           ## Remove words with non-alpha chars
  && !/[^a-z]/       ## Remove words starting with a capital
  && ( $max[0] <= length $_ )
                     ## Remove words that are too short
  && ( $_ eq join q(), sort split //, $_ )
                     ## Check the word is unchanged when the
                     ## letters are sorted
  && ( $max[0] == length $_
       ? ( push @max, $_ )
       : ( @max = (length $_, $_) )
     )
    ## If the word is the same length as the maximal word
    ## push it onto @max - so we store all the longest words
    ## with maximum length.
    ## If the word is longer than the max length (1st entry
    ## in @max - reset max to include the new max length and
    ## the word.
    while <$fh>;
  return "$_[0] > @max";
  ## Return the name of the file used, the size of the words
  ## and a complete list of the words of that length.
}

sub longest_no_comments {
  open my $fh, q(<), $_[0];
  my @m = (0);
     (chomp)&&!/[^a-z]/&&($m[0]<=length$_)
  &&($_ eq join q(),sort split//,$_)
  &&($m[0]==length$_?(push@m,$_):(@m=(length$_,$_)))
     while <$fh>;
  return "$_[0] > @m";
}

## Long words that you may not recognise....
##
## All 21 of the 6 letter words in the "small" dictionary
## are common words.
##
## Two (billowy & beefily) are common in the "huge" list
## The other two 7 letter words are:
##
##   chikors  - An alternative spelling of chukars - A
##              species of partridge native to central
##              Asia (Alectoris chukar).
##
##   dikkops  - (From afrikaans) A bird of the family
##              Burhinidae. The stone curlew, thick-knee.
##              Comes from dik-kop or thick head
##
## Finally the 8 letter word in the insane diction is:
##
##   aegilops - a genus of Eurasian and North American
##              plants in the grass family, Poaceae.
##              They are known generally as goat grasses.
##              Some species are known as invasive weeds
##              in parts of North America.
##


