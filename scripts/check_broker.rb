
#! /bin/env ruby

#COOKIE=ULu-v3Y5MP2qKU--ACmJumShbuo
#
#curl --header "Cookie: _session_id=$COOKIE" https://enroll-mobile.dchbx.org/api/v1/mobile_api/employers_list > broker.json
#
#cat broker.json | ruby -e 'require "json"; j = JSON.parse STDIN.read; print j["broker_clients"].map{|c| c[#"employer_details_url"]}.join "\n"; ' >  details.urls
#
#cat details.urls | ruby -e 'STDIN.read.split("\n").each_with_index{|u,i| contents = `curl --header \"Cookie: _session_id=ULu-#v3Y5MP2qKU--ACmJumShbuo\" https://enroll-mobile.dchbx.org#{u}`; File.write "details.#{i}.json", contents}'
#
#cat broker.json | ruby -e 'require "json"; j = JSON.parse STDIN.read; print j["broker_clients"].map{|c| c["employer_roster_url"#]}.join "\n"; ' >  roster.urls
#
#cat roster.urls | ruby -e 'STDIN.read.split("\n").each_with_index{|u,i| contents = `curl --header \"Cookie: _session_id=ULu-#v3Y5MP2qKU--ACmJumShbuo\" https://enroll-mobile.dchbx.org#{u}`; File.write "roster.#{i}.json", contents}'
#


require 'json'


cookie = ARGV[0]
CURL = "curl --header \"Cookie: _session_id=#{cookie}\" https://enroll-mobile.dchbx.org"

def fetch path, dest
	print "**** got #{path}, #{dest}\n" 
	cmd = "#{CURL}#{path}"
	#{}"> #{dest}; cat #{dest}"
	print "doing #{cmd}\n"
	results = JSON.parse `#{cmd}`
	File.write dest, (JSON.pretty_generate  results)
	results
end

broker_api = "/api/v1/mobile_api/employers_list"
broker_data = fetch broker_api, "broker.json"

broker_data["broker_clients"].each_with_index do |c, i|
	details = c['employer_details_url'].to_s
	roster = c['employee_roster_url'].to_s
	print "found: details #{details}, roster #{roster}\n----------------\n\n"
	fetch(details, "details.#{i}.json")
	fetch(roster, "roster.#{i}.json")
end
     
