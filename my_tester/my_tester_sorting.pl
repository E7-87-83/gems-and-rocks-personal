#!/usr/bin/perl
use strict;
use warnings;

my %data_ret = 
   ("1 2 4 5 3" 
        => "1 2 3 4 5",
    "7 20 27 5 4 11 14 18 24 7 17 30 9 10 16 8 9 7 21 7" 
        => "4 5 7 7 7 7 8 9 9 10 11 14 16 17 18 20 21 24 27 30",
    "15 27 13 20 6 21 30 12 25 7 15 22 16 27 14 18 5 28 4 2 " 
        => "2 4 5 6 7 12 13 14 15 15 16 18 20 21 22 25 27 27 28 30",
    "17 19 8 23 15 1 30 25 19 24 1 30 26 23 5 1 29 9 13 15" 
        => "1 1 1 5 8 9 13 15 15 17 19 19 23 23 24 25 26 29 30 30",
   );


my $program = "java MySort"; #MODIFY FOR DIFFERENT USES

# ================================================================== #

my $num_of_success = 0;

for my $parameter (keys %data_ret) {
    my $test_return = `$program $parameter`; 
    chomp($test_return);
    if ($test_return == $data_ret{$parameter}) {  
    #CHANGE == INTO "eq" for non-numeric
        print "test case parameter $parameter: passed \n";
        $num_of_success++;
    } 
    else {
        print "test case parameter $parameter: failed \n";
    }
}

print "\n";
print "done ",  scalar keys %data_ret, " test case(s); PASS: $num_of_success case(s) .\n";
