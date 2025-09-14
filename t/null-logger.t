use Test::More;

my $class = 'App::Cpan::Upgraded';
my $local_class = 'Local::Logger';
my @levels = qw(debug error fatal info trace warn);

subtest 'sanity' => sub {
	use_ok $class or BAIL_OUT( "$class did not compile: $@");
	};

subtest "$local_class sanity" => sub {
	can_ok $local_class, qw(new);
	isa_ok my $obj = $local_class->new, $local_class;
	can_ok $obj, map { uc } @levels;
	can_ok $obj, @levels;
	};

subtest 'log levels' => sub {
	isa_ok my $obj = $local_class->new('TRACE'), $local_class;
	foreach my $level (@levels) {
		open local *STDOUT, '>', \my $string;
		$obj->$level('This is a test message');
		like $string, qr/\A > \( \Q$level\E \)/x, "has log level in message for <$level>";
		}
	};

done_testing();
