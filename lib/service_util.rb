require_relative 'base_util'

class ServiceUtil < BaseUtil
  include Helper

  SERVICES_RATE_JSON = 'services_rates.json'

  def target_path
    "#{@use_case_directory}/#{SERVICES_RATE_JSON}"
  end

  def create_services_rates
    ::ServiceRateData::services_rates
  end

end