#!/bin/perl
# client perl
# 08/08/2018 DVA Création

use strict;
use warnings;
use IO::Socket::INET;

############
# VARIABLE #
############


my $serveur = defined($ARGV[0]) ? $ARGV[0] : 'localhost';
my $port    = defined($ARGV[1]) ? $ARGV[1] : '7777';
my $msg     = defined($ARGV[2]) ? $ARGV[2] : 'Hello World';

# auto-flush on socket
local $| = 1;


############
#   MAIN   #
############

print("Connexion a $serveur:$port :\n");

# create a connecting socket
my $socket = new IO::Socket::INET (
	PeerHost => $serveur,
	PeerPort => $port,
	Proto => 'tcp',
);
die("\tCannot connect to the server $!\n") unless $socket;
print("\tConnected to the server\n");

# data to send to a server
my $req = $msg . int(rand(100));
my $size = $socket->send($req) or die("send $!\n");
print("\tsent data ($req) of length $size\n");

# notify server that request has been sent
shutdown($socket, 1) or die("shutdown $!\n");

# receive a response of up to 1024 characters from server
my $response = '';
$socket->recv($response, 1024) or die("recv $!\n");
print("\tReceived response: $response\n");

$socket->close() or die("close $!\n");
print("Fin\n");
exit(0);
