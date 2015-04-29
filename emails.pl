use strict;
use warnings;

my $email_count = 0;
open(my $in, "<", "data.json") or die "Can't open the json file";
open(my $out, ">", "out.csv") or die "Can't open the output csv file";
my $in_count = 0;
my $tmp = "";
# Looping through every line in the file
while(<$in>)
{
	if (/"creditcard":"(\d+\-\d+\-\d+\-\d+)/)
	{	
		$tmp = $1;# Storing the credit card number of theleaked person	
		if ($_ =~ /"name":"(\S*\s*\S*\s*\S*)","email"/)
		{
			print $out $1.",".$tmp."\n";# Writing to the csv file
		}	 	
		
	}
}
