#!/bin/sh
aptitude search ~i -F "%c %M %p" | grep -v "i A" | cut -d " " -f 4
