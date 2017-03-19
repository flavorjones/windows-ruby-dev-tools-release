#
#  include this in your powershells as:
#
#    . "c:\var\vcap\packages\windows-ruby-dev-tools\prelude.ps1"
#
Set-PSDebug -trace 1            # "set -x"
Set-PSDebug -strict             # "set -u"
$ErrorActionPreference = "Stop" # "set -e"

function conditional-package-prepend-path {
    param ($pkg)
    $dir = "c:\var\vcap\packages\$($pkg)\bin"
    if (test-path $dir) {
        $env:PATH = $dir + ";" + $env:PATH
    }
}

conditional-package-prepend-path "unzip"
conditional-package-prepend-path "patch"
