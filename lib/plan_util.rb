require_relative 'base_util'

class PlanUtil < BaseUtil
  include Helper

  PLANS_JSON = 'plans.json'

  def target_path
    "#{@use_case_directory}/#{PLANS_JSON}"
  end

  def create_available_plans
    ::AvailablePlanData::available_plans
  end

end