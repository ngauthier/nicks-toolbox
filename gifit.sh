#!/bin/sh
TMPDIR=`mktemp -d /tmp/$1.XXXXXX`
ffmpeg -i $1 -r 10 $TMPDIR/%06d.gif
gifsicle --delay=10 --loop -O3 $TMPDIR/*.gif > $1.gif
rm -rf $TMPDIR
