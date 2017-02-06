#! /usr/bin/env ruby

require 'date'
require 'json'
require 'fileutils'
require_relative 'lib/helper'
require_relative 'lib/plan_year'
require_relative 'lib/date'
require_relative 'lib/broker_util'

extend Helper

clear_directory
$branch = ARGV[0] || 'master'
Helper::write_json BrokerUtil.new.create_broker_details, 'generated/broker_1/broker_details.json', "#{__dir__}"