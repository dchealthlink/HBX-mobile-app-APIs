require_relative 'base_util'
require_relative 'data/plan_builder_data'
require_relative 'plan_builder'

class PlanUtil < BaseUtil
  include Helper

  PLANS_JSON = 'plans.json'

  def target_path
    "#{@use_case_directory}/#{PLANS_JSON}"
  end

  def is_valid_csr_plan plan
    %{ silver gold platinum }.include? plan[:metal_level]
  end

  def create_valid_csr_plans_for num_members
    create_plans_for(num_members).select { |p| is_valid_csr_plan p }
  end

  def create_plans_for num_members
    builder = ::PlanBuilder.new fixed_shuffler, num_members
    builder.add_all_plans
  end

end