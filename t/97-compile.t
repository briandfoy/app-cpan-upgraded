use Test::More;

my $file = 'blib/script/cpan';

BAIL_OUT "Script file is missing!" unless -e $file;

my $output = `$^X -Ilib -c $file 2>&1`;
like( $output, qr/syntax OK$/, 'script compiles' )
	or BAIL_OUT "Script file <$file> does not compile!";

done_testing();
