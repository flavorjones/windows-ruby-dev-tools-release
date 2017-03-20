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
    param ($pkg)
    $dir = "c:\var\vcap\packages\$($pkg)\bin"
    if (test-path $dir) {
        $env:PATH = $dir + ";" + $env:PATH
    }
}

conditional-package-prepend-path "unzip"
conditional-package-prepend-path "patch"
conditional-package-prepend-path "git"
