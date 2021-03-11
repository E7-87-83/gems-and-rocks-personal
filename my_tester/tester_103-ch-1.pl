#!/usr/bin/perl
use strict;
use warnings;
# Testing script for The Weekly Challenge #103 Task 1

my %data_ret = 
   (2017 => "Fire Rooster",
    1938 => "Earth Tiger",
    1997 => "Fire Ox",
    1990 => "Metal Horse",
    1967 => "Fire Goat",
   );


my $program = "perl ch-1.pl"; #MODIFY FOR DIFFERENT USES

# ================================================================== #

my $num_of_success = 0;

for my $parameter (keys %data_ret) {
    my $test_return = `$program $parameter`; 
    chomp($test_return);
    if ($test_return eq $data_ret{$parameter}) {  
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
