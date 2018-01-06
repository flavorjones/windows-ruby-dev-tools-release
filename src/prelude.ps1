#
#  include this in your powershells as:
#
#    . "c:\var\vcap\packages\windows-ruby-dev-tools\prelude.ps1"
#
Set-PSDebug -trace 1            # "set -x"
Set-PSDebug -strict             # "set -u"
$ErrorActionPreference = "Stop" # "set -e"

# avoid overly narrow default linewrap
$term = (get-host).ui.rawui
$size = $term.buffersize
$size.width = 128
$term.buffersize = $size
$size = $term.windowsize
$size.width = 128
$term.windowsize = $size

function conditional-package-prepend-path {
    param ($dir)
    $dir = "c:\var\vcap\packages\$($dir)"
    if (test-path $dir) {
        prepend-path $dir
    }
}

function prepend-path {
    param ($dir)
    $env:PATH = $dir + ";" + $env:PATH
}

function system-cmd {
    param ($command)
    cmd.exe /c $command
    if (-not ($?)) {
        throw "$($command) failed"
    }
}

conditional-package-prepend-path "unzip\bin"
conditional-package-prepend-path "patch\bin"
conditional-package-prepend-path "git\bin"
conditional-package-prepend-path "gpg"

if ($env:WIN_RUBY_VERSION -eq "2.3") {
    write-host "Selected Ruby 2.3"
    conditional-package-prepend-path "ruby-2.3\bin"
} elseif ($env:WIN_RUBY_VERSION -eq "2.4") {
    write-host "Selected Ruby 2.4"
    conditional-package-prepend-path "ruby-2.4\bin"
} else {
    write-host "Defaulting to Ruby 2.4, set WIN_RUBY_VERSION env var to override"
    conditional-package-prepend-path "ruby-2.4\bin"
}
