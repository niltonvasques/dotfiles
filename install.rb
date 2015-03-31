#!/usr/bin/env ruby

def are_you_sure
  puts "Are you sure?"
  if gets in {'y', 'Y'}
    true
  end
  false
end

are_you_sure
