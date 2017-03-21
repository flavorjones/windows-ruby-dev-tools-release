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
        $env:PATH = $dir + ";" + $env:PATH
    }
}

conditional-package-prepend-path "unzip\bin"
conditional-package-prepend-path "patch\bin"
conditional-package-prepend-path "git\bin"
conditional-package-prepend-path "gpg"
