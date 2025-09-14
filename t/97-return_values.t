#!/usr/bin/perl
use strict;
use warnings;

$|++;

use Test::More;

use File::Spec::Functions qw(catfile devnull);
my $devnull = devnull();
my $out = "t/97-return_values.out";
sub mycat {
    my ( $file ) = @_;
    open FH, $file or die "Could not open '$file': $!";
    diag <FH>;
}

my $command     = catfile qw( blib script cpan );
my $config_file = catfile qw( t 97-lib_cpan1 CPAN Config.pm );

# Ensure the script is there and ready to run
ok( -e $command, "$command is there" ) ||
	BAIL_OUT( "Can't continue without script" );
ok( ! system( "$^X -Mblib -c $command 1>$devnull 2>&1" ), "$command compiles" ) ||
	BAIL_OUT( "Can't continue if script won't compile" );

# Ensure the configuration file is there and ready to run
ok( -e $config_file, "Config file exists" );
ok( ! system( "$^X -c $config_file 1>$devnull 2>&1" ), "Config file compiles" );

# Some options for all commands to load our test config
my @config = ( '-j', $config_file );

my @trials = (
	[ 0, [ '-J'                     ] ],
	[ 1, [ 'Local::Prereq::Fails'   ] ],
	[ 1, [ 'Local::Make::Fails'     ] ],
	[ 1, [ 'Local::Test::Fails'     ] ],
	[ 1, [ 'Local::Unsupported::OS' ] ],
	[ 0, [ 'Local::Works::Fine'     ] ],
	);


foreach my $trial ( @trials ) {
	my( $expected_exit_value, $options ) = @$trial;

	my $rc = do {
		my $command = "$^X -Mblib -I. $command @config @$options 1>$out 2>&1 ";
		#diag( "Command is [$command]" );
		system $command;
		};

	my $exit_value = $rc >> 8;

	is( !!$exit_value||0, $expected_exit_value, "$command @config @$options" ) or mycat $out;
	}

done_testing();
