#!/usr/bin/env ruby
# Copyright [2015] [Nilton Vasques <nilton.vasques@gmail.com>]
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

HOME = ENV['HOME']

def are_you_sure?
  print "Are you sure? [y/N]: "
  %w[y Y].include?(gets.chop)
end

def dotfiles_list
  dotfiles = Dir['.*'] - ['.', '..']
  dotfiles -= dotfiles.select{ |dot| dot[/.git/] || dot[/.swp/] }
end

dotfiles_list.each do |dot|
  dest_file = "#{HOME}/#{dot}"
  dot = "#{Dir.pwd}/#{dot}"
  if File.file?(dest_file) || File.directory?(dest_file) || File.symlink?(dest_file)
    puts "#{dest_file} exists and will be erased."
    if are_you_sure?
      puts "rm -Rf #{dest_file}"
      system "rm -Rf #{dest_file}"
      puts "Create symlink #{dest_file} -> #{dot}"
      File.symlink(dot, dest_file)
    end
  else
    puts "Create symlink #{dest_file} -> #{dot}"
    File.symlink(dot, dest_file)
  end
end

# Install base16-default theme in gnome-terminal
puts "Do you want install base-16 theme to gnome-terminal?"
if are_you_sure?
  system "source gnome-terminal/base16-gnome-terminal/base16-default.dark.sh"
  system "echo 'export TERM=screen-256color-bce' >> ~/.bashrc"
  puts "After finish setup, restart gnome-terminal and choose theme in profiles."
end

# Setting solarized theme to gnome-terminal
puts "Do you want install sollarized theme to gnome-terminal?"
if are_you_sure?
  system "./gnome-terminal/iterm2themes-gnome-term.sh zenburn"
  system "echo 'export TERM=screen-256color-bce' >> ~/.bashrc"
end

# Setting solarized theme to ls
puts "Do you want install sollarized theme to ls command?"
if are_you_sure?
  ls_theme = "#{Dir.pwd}/gnome-terminal/dircolors-solarized/dircolors.256dark"
  ls_theme_link = "#{HOME}/.dir_colors"
  puts "Create symlink #{ls_theme} -> #{ls_theme_link}"
  File.symlink(ls_theme, ls_theme_link)
  File.open("#{HOME}/.bashrc", 'a') do |f|
    f.puts "eval `dircolors ~/.dir_colors`"
    f.puts "source #{Dir.pwd}/bash_functions.sh"
  end
end

puts "Do you want install powerline configurations?"
if are_you_sure?
  powerline = "#{Dir.pwd}/powerline"
  powerline_dest = "#{HOME}/.config/powerline"
  puts "Create symlink #{powerline_dest} -> #{powerline}"
  if File.file?(powerline_dest) || File.directory?(powerline_dest) || File.symlink?(powerline_dest)
    system "rm -Rf #{powerline_dest}"
  end
  File.symlink(powerline, powerline_dest)
end
