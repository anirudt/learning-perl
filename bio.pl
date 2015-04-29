use strict;
use warnings;

my $count = 0;
my $tot_x = 0;
my $tot_y = 0;
my $tot_z = 0;
my $htot_x = 0;
my $htot_y = 0;
my $htot_z = 0;

my $incount = 0;
my $units = 0;
open(my $in, "<", "1ASY.pdb") or die "Can't open the protein database";
open(my $out, ">", "res1.pdb") or die "Can't open the result";
while(<$in>)
{	
	if(/ATOM/)
	{
		$count++;
		#print $out $_;
		if(/\sA\s+\d/ || /\sB\s+\d/)
		{

			if(/(\-?\d+\.\d+)(\s+)(\-?\d+\.\d+)(\s+)(\-?\d+\.\d+)/)
			{
				$tot_x = $tot_x + $1;
				$tot_y = $tot_y + $3;
				$tot_z = $tot_z + $5;
				$incount++;	
			}
			else
			{}
			if(/ALA|ILE|LEU|PRO|PHE|VAL|GLY/)
			{
				if(/(\-?\d+\.\d+)(\s+)(\-?\d+\.\d+)(\s+)(\-?\d+\.\d+)/)
				{
					$htot_x = $htot_x + $1;
					$htot_y = $htot_y + $3;
					$htot_z = $htot_z + $5;
					$units++;	
				}
				else
				{}
			}

		}

	}	
}
$tot_x = $tot_x/$incount;
$tot_y = $tot_y/$incount;
$tot_z = $tot_z/$incount;
print $tot_x." ".$tot_y." ".$tot_z."\n";
print $incount."\n";

$htot_x = $htot_x/$units;
$htot_y = $htot_y/$units;
$htot_z = $htot_z/$units;
print $htot_x." ".$htot_y." ".$htot_z."\n";
print $units;
