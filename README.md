# An upgraded version of App::Cpan and the cpan command

The `cpan` command comes with the CPAN.pm distribution, and is also a
core module. The [main repo](https://github.com/andk/cpanpm) is
[behind on several patches](https://github.com/andk/cpanpm/issues/187)
to `cpan`, so this repo is what `cpan` should be.

## Installation

Install `App::Cpan::Upgraded` like any other module.

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
* In January 2025, I started this updated version of `cpan` backed by
App::Cpan::Upgraded.
