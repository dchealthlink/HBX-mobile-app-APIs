#! /usr/bin/env ruby

require 'date'
require 'json'
require 'fileutils'
require 'jbuilder'
require_relative 'lib/helper'
require_relative 'lib/plan_year'
require_relative 'lib/date'
require_relative 'lib/broker_util'
require_relative 'lib/individual_util'
require_relative 'lib/service_util'
require_relative 'lib/plan_util'
require_relative 'lib/user_existence_util'
require_relative 'lib/security_util'
require_relative 'lib/scenarios'
require_relative 'lib/data/basic_data'
require_relative 'lib/data/insured_data'
require_relative 'lib/data/health_plan_data'
require_relative 'lib/data/client_data'
require_relative 'lib/data/service_rate_data'
require_relative 'lib/data/security_data'
require_relative 'lib/data/user_existence_data'

branch = ARGV[0] || 'master'
$github_url_prefix = "https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/#{branch}"

$GENERATED_DIR = 'generated'
$ROOT_DIRECTORY = "#{__dir__}/#{$GENERATED_DIR}"

Scenarios.create_broker_1
Scenarios.create_empty_broker
Scenarios.create_broker_er_in_open_enrollment
Scenarios.create_broker_er_in_pending
Scenarios.create_employee
Scenarios.create_individual_uqhp
Scenarios.create_individual_aptc
Scenarios.create_services_rates
Scenarios.create_plans_for_uqhp_single
Scenarios.create_plans_for_uqhp_family
Scenarios.create_plans_for_csr_family
Scenarios.create_check_user_existence
Scenarios.create_iam_login_response