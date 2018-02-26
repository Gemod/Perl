#!/usr/bin/perl
if(qx{id -u}!=0)
{
	print "you are not root user!\n";
	exit;
}
else
{
	for(my $i=0;$i<=$#ARGV;$i++)
	{
		print "installing $ARGV[$i]\n";
		qx{apt-get -y install $ARGV[$i]};
		print "Done!\n";
	}
}
