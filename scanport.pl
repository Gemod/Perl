#!/usr/bin/perl
 
# TCP-UDP Port scanner
 
use IO::Socket;
 

#clear buffer
$| = 1;
 
# Take input from user - hostname, start port , end port
print "Enter Target/hostname : ";
 
# Need to chop off the newline character from the input
chop ($target = <stdin>);
print "Start Port : ";
chop ($start_port = <stdin>);
print "End Port : ";
chop ($end_port = <stdin>);
 
# start the scanning loop
foreach ($port = $start_port ; $port <= $end_port ; $port++) 
{
    #\r will refresh the line
    print "\rScanning port $port";
     
    #Connect to port number
    $socket = IO::Socket::INET->new(PeerAddr => $target , PeerPort => $port , Proto => 'tcp' , Timeout => 1);
     
    #Check connection
    if( $socket )
    {
        print "\r = Port $port is open.\n" ;
    }
    
}
print "\n";
print "Scanning port with UDP protocol\n";
foreach ($i=$start_port;$i<=$end_port; $i++)
{
 	print "\rScanning port $i";

	$UDPsocket = IO::Socket::INET->new(PeerAddr => $target, PeerPort => $i, Proto => 'udp', Timeout => 1);

	if($UDPsocket)
	{
		print "\r = Port $i is open.\n";	
	}
}

print "\n\nFinished Scanning $target\n";
 
exit (0);
