#!/usr/bin/env ruby
#---------------------------------------------------------------------------
# LICENSE
#---------------------------------------------------------------------------
#"THE BEER-WARE LICENSE" (Revision 42):
#<nilton.vasques@gmail.com> wrote this file. As long as you retain this notice you
#can do whatever you want with this stuff. If we meet some day, and you think
#this stuff is worth it, you can buy me a beer in return Nilton Vasques 
#----------------------------------------------------------------------------
#
# Description: This script intend fix songs info as artist, album and title.
# Required: id3tool package
#
#
require 'mkmf'
require 'fileutils' #I know, no underscore is not ruby-like
include FileUtils

def help
  puts "list : List all media information."
  puts "parse : List informations parsed from song name and folder."
  puts "help : Show this help."
end

def parse(option)
  Dir['*/'].each do |folder|
    album = folder.split('/').join().split('-')[1].strip
    puts album
    Dir[folder+'*.mp3'].each do |music|
      file = music.split('/')[1]
      name = file.split('-')[1].strip.split('.mp3')[0]

      case option
      when 'list'
        system( "id3tool '#{music}'")
      when 'set'
        system( "id3tool -t '#{name}' -a '#{album}' '#{music}'")
      when 'parse'
        puts "Album: #{album}"
        puts "Song: #{name}"
      when 'help'
        help
      else 
        puts "Invalid option. Type help for usage"
      end
    end
  end
end


EXEID3 = find_executable 'id3tool'
if EXEID3.nil? 
  puts "id3tool package not found!"
  Kernel.exit(false)
else

  option = 'parse'

  if !ARGV.empty?
    option = ARGV[0]
  end

  case option
  when 'list'
    parse option
  when 'set'
    parse option
  when 'parse'
    parse option
  when 'help'
    help
  else 
    puts "Invalid option. Type help for usage"
  end
end 

