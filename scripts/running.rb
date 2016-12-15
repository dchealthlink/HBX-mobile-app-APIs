#!/bin/env ruby
procs = `ps ax | grep rails | grep -v grep`.lines
hash = Hash[procs.map do |p| 
	p =~ /\s*(\d*) .*/
	["/proc/#{$1}/environ", p] 
end]
hash.each do |env, line| 
	loc = `grep -az "\\bPWD" #{env}` 
	print "#{loc}\n#{line}\n"
end
