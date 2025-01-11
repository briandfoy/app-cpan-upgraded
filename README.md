# An upgraded version of App::Cpan and the cpan command

The `cpan` command comes with the CPAN.pm distribution, and is also a
core module. The [main repo](https://github.com/andk/cpanpm) is
[behind on several patches](https://github.com/andk/cpanpm/issues/187)
to `cpan`, so this repo is what `cpan` should be.

## This is GreyPAN

DarkPAN is the comprehensive set of Perl modules, including all the
private ones that aren't distributed through CPAN and that the Perl
community cannot test. This module is "GreyPAN"; it's not on CPAN, but
you know about it.

This code is not on CPAN because only one distribution can have the
index version of a module.

I'm still hoping that I can get these changes into the main CPAN.pm
distribution so these changes can be distributed with perl. I prefer
to not fork this code.

## Installation

Install this from the releases
from [the briandfoy/app-cpan](https://github.com/briandfoy/app-cpan).
You probably want to install this in a [local::lib]() directory so you
don't disturb the distributed version:

	# download the tarball, unpack it, and change into its directory
	% cpan -I .

Once the updated `App::Cpan` is installed, find the path to the updated
`cpan`. In your `local::lib`, there will be a `bin` directory next to the
`lib`; that's where `cpan` should be.

	$ cpan -I .
	Running make test for /Users/brian/Dev/~~Others/cpanpm-filtered/.
	PERL_DL_NONLAZY=1 "/usr/local/perls/perl-5.40.0/bin/perl" "-MExtUtils::Command::MM" "-MTest::Harness" "-e" "undef *Test::Harness::Switches; test_harness(0, 'blib/lib', 'blib/arch')" t/*.t
	t/97-compile.t ................ ok
	...
	t/97-run.t .................... ok
	All tests successful.
	Files=9, Tests=134,  6 wallclock secs ( 0.02 usr  0.01 sys +  3.04 cusr  0.95 csys =  4.02 CPU)
	Result: PASS
	Running make install for ...
	Installing /Users/brian/perl5/lib/perl5/.DS_Store
	Installing /Users/brian/perl5/lib/perl5/App/Cpan.pm
	Installing /Users/brian/perl5/lib/perl5/App/filter.pl
	Installing /Users/brian/perl5/bin/cpan
	Appending installation info to /Users/brian/perl5/lib/perl5/darwin-2level/perllocal.pod
	  /usr/bin/make install  -- OK

If that `bin` directory is in your path, it should find that `cpan` first.

## Some history

* I wrote `cpan` some time before 2002, The [cpan-script](https://github.com/briandfoy/cpan-script/blob/master/Changes)
has some of the details.
* `cpan` was imported into the CPAN.pm repo around July 2002.
* I turned cpan (v1.3) into a script distribution in December 2002
* For awhile, there was parallel development with CPAN.pm grabbing
my changes from [cpan-script](https://github.com/briandfoy/cpan-script).
* I wrote App::Cpan to make the cpan script a module. This was distributed
as its own module for awhile (under BDFOY) and synced into CPAN.pm
* At some point, we decided to do all the development in the CPAN.pm
repo and I shut down [cpan-script](https://github.com/briandfoy/cpan-script).
* App::Cpan and cpan were moved to the CPAN.pm repo, and I'd make
pull requests to update or fix things.
* My last merged pull request is from December 2021 (https://github.com/andk/cpanpm/pull/153)
* Around November 2022, I evaluated all of the issues in RT and made GitHub issues
for them. I took supplied patches and made pull requests. These received no
response. No issues have received responses from the maintainers since then
* In December 2023, I pinged each of these with no response. I also
emailed Andreas to ask what I could do to help, and he declined my
assistance.
* In December 2024 I asked [if I should fork cpan](https://github.com/andk/cpanpm/issues/187).
No response.
* And, here we are. Code that I wrote exists in a distro that does not
respond to issues and won't let me fix my own code.
* In January 2025, I started this updated version of `cpan`
