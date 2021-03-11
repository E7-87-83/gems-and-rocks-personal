#!/usr/bin/perl
use strict;
use warnings;

my %data_ret = 
   (1 => 1,
    7 => 5040,
    8 => 40320,
    10 => 3628800,
   );


my $program = "java factorial"; #MODIFY FOR DIFFERENT USES

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
