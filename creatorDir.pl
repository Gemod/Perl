#!/usr/bin/perl
use strict;
use warnings;
for(my $i=1;$i<$#ARGV;$i++)
{
	qx(mkdir -p $ARGV[0]/$ARGV[$i]/"etc"/"network");
	qx(touch $ARGV[0]/$ARGV[$i]/"etc"/"network"/interfaces);
}
if($ARGV[$#ARGV] eq 1)
{
	my @paths=qx{find $ARGV[0]/ | grep interfaces};
	qx{ gedit $_} foreach(@paths);
}

