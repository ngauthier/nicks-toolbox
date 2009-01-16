#!/bin/sh
for pkg in $(aptitude search ~i -F "%c %M %p" | grep -v "i A" | cut -d " " -f 4) ; do
  echo "-- markauto $pkg --"
  sudo aptitude markauto $pkg
done
