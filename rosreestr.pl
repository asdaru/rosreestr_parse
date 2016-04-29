
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
	my $res = $ua->get( 'http://maps.rosreestr.ru/arcgis/rest/services/Cadastre/CadastreSelected/MapServer/exts/GKNServiceExtension/online/parcel/find?cadNum=50:04:0180301:' . $_ . '&onlyAttributes=false&f=json' => { DNT => 1 } )->res;
	my $dom=$res->json;
#	my $dom = Mojo::DOM->new( $res->body );
	my $CP_VALUE = $dom->{features}->[0]->{attributes}->{CP_VALUE};
	
	print '50:04:0180301:' . $_ ."\t".$CP_VALUE*1000."\n" if ($CP_VALUE)
	#warn $CP_VALUE->{value};
	#use Data::Dumper; warn Dumper($CP_VALUE);
	#warn $_;

	#use Data::Dumper;warn Dumper( $dom->{features}->[0]->{attributes}->{CP_VALUE} );

}

