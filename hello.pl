#!/usr/bin/perl
use strict;
use warnings;

my $name = "anirud";
print $name;
my $count = 0;
if("Hello World" =~ /World/)
{
	print "World is present";
}
#Note that `~` is always used for regular expression checking
#Metacharacters need to be preceded by backslashes in order to be used as part of regexes.

open(my $in, "<", "access_log") or die "can't open file\n";
while(<$in>) {
	if(/(\d+)\.(\d+)\.(\d+)\.(\d+)/)
	{
		print "$1."."$2."."$3."."$4\n";
		$count++;
	}
}
print $count;
