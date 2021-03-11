#!/usr/bin/perl
# Testing script for The Weekly Challenge #103 Task 2
use strict;
use warnings;

my %data_ret = 
   ("<< EOF\n10\n20\nch2data.csv\nEOF" => "Les Miserables Episode 1: The Bishop (broadcast date: 1937-07-23)\n00:00:10",
    "<< EOF\n1606134123\n1614591276\nch2data.csv\nEOF" => "Les Miserables Episode 1: The Bishop (broadcast date: 1937-07-23)\n00:10:24",
    "<< EOF\n0\n1716\nch2data.csv\nEOF" => "Les Miserables Episode 2: Javert (broadcast date: 1937-07-30)\n00:00:06"
   );


my $program = "perl ch-2.pl"; #MODIFY FOR DIFFERENT USES

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
