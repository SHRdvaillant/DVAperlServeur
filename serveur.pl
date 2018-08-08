#!/bin/perl
# serveur perl
# 08/08/2018 DVA Création

use strict;
use warnings;
use IO::Socket::INET;


############
# VARIABLE #
############

my $port = '7777';

# auto-flush on socket
local $| = 1;

my $LOG;
open ($LOG, '>', './serveur.log');

############
# VARIABLE #
############

sub say($){
	my ($msg) = @_;
	print("$msg");
	print $LOG "$msg";
}

############
#   MAIN   #
############

# creating a listening socket
my $socket = new IO::Socket::INET (
	LocalHost => '0.0.0.0',
	LocalPort => $port,
	Proto => 'tcp',
	Listen => 5,
	Reuse => 1
);
die "Cannot create socket $!\n" unless $socket;
say("Server started on port $port\n");

my $running = 1;
while($running){
	say("\tServer waiting for client connection\n");

	# waiting for a new client connection
	my $client_socket = $socket->accept() or die("accept $!\n");

	# get information about a newly connected client
	my $client_address = $client_socket->peerhost() or die("peerhost $!\n");
	my $client_port = $client_socket->peerport() or die("peerport $!\n");
	say("\tConnection from $client_address:$client_port\n");

	# read up to 1024 characters from the connected client
	my $data = '';
	if(!defined($client_socket->recv($data, 1024))){
		die("recv $!\n");
	}
	say("\tReceived data: $data\n");

	# write response data to the connected client
	if($data =~ m/^stop/){
		$running = 0;
		$data = 'arret demandé';
	}else{
		$data = 'ok';
	}
	$client_socket->send($data) or die("send $!\n");

	# notify client that response has been sent
	shutdown($client_socket, 1) or die("shutdown $!\n");
	say("\n");
}

$socket->close() or die("close $!\n");
say("Server done\n");
close($LOG);
exit(0);
