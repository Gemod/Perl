#!/usr/bin/perl
use strict;
use warnings;
my @paths=qx{find | grep interfaces};

foreach my $i (@paths)
{
	qx(nano $i);
}
