#!/usr/bin/env ruby

def are_you_sure?
  print "Are you sure? [y/N]: "
  if %w[y Y].include?(gets.chop)
    true
  end
  false
end

if ARGV[0] == "--superuser"
  exit
end

if are_you_sure?
  exec "sudo ./install.rb --superuser"
end
