#!/bin/env ruby
procs = `ps ax | grep rails | grep -v grep`.lines
hash = Hash[procs.map do |p| 
	p =~ /\s*(\d*) .*/
	["/proc/#{$1}/environ", p] 
end]
hash.each do |env, line| 
	loc = `grep -az "\\bPWD" #{env}`.gsub(/^PWD=/, "").gsub("\u0000", '') 
	branch = `cd #{loc}	; git status 2>&1`.lines[0]
	print "#{line}running in: #{loc}\n#{branch}\n"
end