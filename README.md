# windows-ruby-dev-tools-release

This is a [BOSH](https://github.com/cloudfoundry/bosh) release to
install some tools on a windows stemcell for Ruby development.

It was driven out by the desire to
use [Concourse](https://concourse.ci/) to CI
the [Nokogiri toolchain](http://status.nokogiri.org) across multiple
operating systems.


## Tools Installed

- [Ruby 2.3 with optional DevKit](https://rubyinstaller.org/)
- [unzip](http://gnuwin32.sourceforge.net/packages/unzip.htm)
- [patch](http://gnuwin32.sourceforge.net/packages/patch.htm)
- [Git](https://github.com/git-for-windows/git/releases)
- [gpg](https://www.gnupg.org)
- a `prelude.ps1` file for all your powershell needs


## Tools Not Yet Installed (But I Plan To Do Soon)

- More Rubies, with DevKit
- CMake


## How do I use this?

### `prelude.ps1`

This prelude file sets up some sound defaults for your powershell scripts:

* the powershell equivalent of bash's `set -eux`
* set up output to not have ridiculously small linewraps
* a cmdlet, `system-cmd` that will do what you expect with a command string

You use it by putting this line at the top of your powershell scripts:

``` powershell
. "c:\var\vcap\packages\windows-ruby-dev-tools\prelude.ps1"
```


### Ruby

By default, Ruby 2.3 will be in your search path as `ruby` or `ruby.exe`, as will utilities like `gem`.

You can opt into using DevKit by setting this line in your powershell script:

``` powershell
$env:RUBYOPT = "-rdevkit"
```


### Other executables

All the other executables are in your search path, so just go ahead and use `unzip` and other utilities like you normally would.


## TODO

- [ ] ruby 2.4 with devkit (blocked on msys2 headless installation)
- [x] ruby 2.3 with devkit 
- [ ] ruby 2.2 with devkit
- [ ] ruby 2.1 with devkit
- [ ] document how to choose a ruby
- [x] document how to opt into devkit
- [ ] update concourse-gem with windows-awareness
