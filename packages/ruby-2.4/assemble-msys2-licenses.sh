#! /usr/bin/env bash

# while in the msys2 distribution root directory ...

for f in $(find usr/share/licenses -type f) ; do
  echo
  echo "=== ${f}"
  echo
  cat $f | awk '{ print "    " $0 }'
  echo
done
