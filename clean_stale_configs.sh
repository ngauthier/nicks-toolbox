#!/bin/sh
str=""
for pkg in $(aptitude search ~c -F %p) ; do
   str="$str $pkg"
done
sudo aptitude purge $str
