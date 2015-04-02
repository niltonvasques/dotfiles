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
  if %w[y Y].include?(gets.chop)
    true
  end
  false
end

def dotfiles_list
  dotfiles = Dir['.*'] - ['.', '..']
  dotfiles -= dotfiles.select{ |dot| dot[/.git/] || dot[/.swp/] }
end

dotfiles_list.each do |dot|
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
