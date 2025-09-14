#!/usr/bin/perl

use Test::More;

my $class  = 'App::Cpan::Upgraded';
my $method = '_process_options';

subtest 'sanity' => sub {
	use_ok( $class );
	can_ok( $class, $method );
	};

subtest 'mock CPAN shell' => sub {
	ok require "./t/97-lib_cpan1/CPAN.pm";
	ok( defined &CPAN::shell, "Mock CPAN shell is defined" );
	is( CPAN::shell(), 1, "Mock shell returns 1" );
	};

subtest '-T in CPAN_OPTS' => sub {
	local $ENV{CPAN_OPTS} = '-T';
	my @args = qw(Some::Module);

	my $options  = $class->_process_options(@args);
	ok( $options->{T}, 'options include -T from CPAN_OPTS' );
	};


subtest dash_g_in_argv => sub {
	delete local $ENV{CPAN_OPTS};
	my @args = qw(-g Some::Module);

	my $options  = $class->_process_options(@args);
	ok( $options->{g}, 'options include -g from args' );
	};

done_testing();
