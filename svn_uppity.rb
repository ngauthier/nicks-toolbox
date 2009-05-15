#!/usr/bin/env ruby

who_cmd = "svn info -r HEAD | grep Author"
last_rev_alerted = 0

while(true)
  `svn info > /tmp/svn_uppity.local.txt`
  `svn info -r HEAD > /tmp/svn_uppity.remote.txt`
  rev = `diff /tmp/svn_uppity.local.txt /tmp/svn_uppity.remote.txt | grep Revision`
  if rev.size > 1
    rev =~ /^> Revision: (.+)$/
    rev = $1
    who = `#{who_cmd}`
    who =~ /^Last Changed Author: (.+)$/
    who = $1
    if rev != last_rev_alerted
      puts "New Revision #{rev} by #{who}"
      `espeak "New Revision. Number #{rev}. Author #{who}."`
      last_rev_alerted = rev
    end
  end
  sleep(1)
end
