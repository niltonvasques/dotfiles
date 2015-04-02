#!/usr/bin/env ruby

def are_you_sure?
  print "Are you sure? [y/N]: "
  if %w[y Y].include?(gets.chop)
    true
  end
  false
end

HOME = ENV['HOME'] 

dotfiles = Dir['.*'] - ['.', '..']
dotfiles -= dotfiles.select{ |dot| dot[/.git/] || dot[/.swp/] }
dotfiles.each do |dot|
  dest_file = "#{HOME}/#{dot}" 
  if File.file?(dest_file) || File.directory?(dest_file)
    puts "#{dest_file} exists and will be erased."
    if are_you_sure?
      system "rm -Rf #{dest_file}"
      #system "ln -s #{dot}"
    end
    File.symlink(dot, dest_file)
  end
end
