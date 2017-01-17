#!/usr/bin/env perl
use lib '/home/asda/workspace/ruscience/mojo/lib';
use Mojo::Base 'Mojolicious::Controller';
use Mojo::UserAgent;
use Data::Dumper;
use Mojo::DOM;
use HTTP::Cookies;
use Mojo::Util qw(decode);
use Mojo::URL;

my $ua = Mojo::UserAgent->new;

foreach ( 1 .. 1500 ) {
	my $res = $ua->get( 'https://pkk5.rosreestr.ru/api/features/1/50:4:180301:' . $_ => { DNT => 1 } )->res;
	my $dom = $res->json;

	next unless $dom->{feature};

	my $attrs = $dom->{feature}->{attrs};

	print $attrs->{id}. "\t" . $attrs->{cad_cost}. "\n" ;
	#print $attrs->{id}. "\t" . $attrs->{cad_cost}."\t".($attrs->{cad_eng_data} ? $attrs->{cad_eng_data}->{co_name}:""). "\n" ;

}

