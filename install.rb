#!/usr/bin/env ruby
puts "Setup dotfiles"

def are_you_sure?
  print "Are you sure? [y/N]: "
  if %w[y Y].include?(gets.chop)
    true
  end
  false
end

HOME = ENV['HOME'] 
puts HOME

dotfiles = Dir['.*'] - ['.', '..']
p dotfiles
dotfiles -= dotfiles.select{ |dot| dot[/.git/] || dot[/.swp/] }
p dotfiles
dotfiles.each do |dot|
  dest_file = "#{HOME}/#{dot}" 
  if File.file?(dest_file) || File.directory?(dest_file)
    puts "#{dest_file} exists and will be erased."
    if are_you_sure?
      system "rm -Rf #{dest_file}"
      #system "ln -s #{dot}"
    end
  end
  puts "Create symlink #{dest_file} -> #{dot}"
  File.symlink(dot, dest_file)
end
