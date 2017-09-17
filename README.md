# windows-ruby-dev-tools-release

This is a [BOSH](https://github.com/cloudfoundry/bosh) release to
install some tools on a windows stemcell for Ruby development.

It was driven out by the desire to
use [Concourse](https://concourse.ci/) to CI
the [Nokogiri toolchain](http://status.nokogiri.org) across multiple
operating systems.


## Tools Installed

- [unzip](http://gnuwin32.sourceforge.net/packages/unzip.htm)
- [patch](http://gnuwin32.sourceforge.net/packages/patch.htm)
- [Git](https://github.com/git-for-windows/git/releases)
- [gpg](https://www.gnupg.org)
- a `prelude.ps1` file for all your powershell needs


## Tools Not Yet Installed (But I Plan To Do Soon)

- Ruby (various versions via [One-Click Installer](https://rubyinstaller.org/))
- [DevKit](http://rubyinstaller.org/add-ons/devkit/) installed for each Ruby
- CMake


## TODO

- [ ] ruby 2.4 with devkit (blocked on msys2 headless installation)
- [ ] ruby 2.3 with devkit 
- [ ] ruby 2.2 with devkit
- [ ] ruby 2.1 with devkit
- [ ] document how to choose a ruby
- [ ] document how to opt into devkit
- [ ] update concourse-gem with windows-awareness
