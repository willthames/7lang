#!/usr/bin/env ruby

if (ARGV.size !=2)
    puts "Usage: grep.rb <pattern> <file>"
    exit 1
end

pattern = ARGV[0]
filename = ARGV[1]

File.open(filename) do |f|
    f.each_line do |line|
        if (/#{pattern}/ =~ line) 
            puts "#{f.lineno}: #{line}"
        end
    end
end 

