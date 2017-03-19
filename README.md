# windows-ruby-dev-tools-release

This is a [BOSH](https://github.com/cloudfoundry/bosh) release to
install some tools on a windows stemcell for Ruby development.

It was driven out by the desire to
use [Concourse](https://concourse.ci/) to CI the Nokogiri toolchain
across multiple operating systems.


## Tools Installed

- [unzip](http://gnuwin32.sourceforge.net/packages/unzip.htm)
- [patch](http://gnuwin32.sourceforge.net/packages/patch.htm)
- a `prelude.ps1` file for all your powershell needs


## Tools Not Yet Installed (But I Plan To Do Soon)

- Ruby (various versions via [One-Click Installer](https://rubyinstaller.org/)
- [DevKit](http://rubyinstaller.org/add-ons/devkit/) installed for each Ruby
- Git
- CMake
