#!/usr/bin/env ruby
def notify(msg)
  puts "NOTIFY: #{msg}"
  `notify-send -i /home/nick/bin/nicks-toolbox/pom.png "Pomodoro" "#{msg}"`
end

unless ARGV.size == 2
  puts "Usage: pomodoro <work time> <rest time>"
  exit(1)
end

POMODORO = ARGV[0].to_i
REST = ARGV[1].to_i

notify "time to flow"
1.upto(POMODORO) do |minute|
  sleep 60

  puts "#{minute}/#{POMODORO}"
  
  if minute % 5 == 0
    notify "#{minute}/#{POMODORO}"
  end
  
  if minute == (POMODORO-1)
    notify "One minute left!"
  end
end

`rhythmbox-client --pause`
`gnome-screensaver-command -a`

sleep REST * 60

`gnome-screensaver-command -d`
notify "Welcome Back"

