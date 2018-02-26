#!/usr/bin/perl
my @infoMem=qx {free -m};
print @infoMem;
