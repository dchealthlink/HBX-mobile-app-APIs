require_relative 'base_util'

class SecurityUtil < BaseUtil
  include Helper

  IAM_LOGIN_RESPONSE_JSON = 'iam_login_2_factor_response.json'

  def target_path
    "#{@use_case_directory}/#{IAM_LOGIN_RESPONSE_JSON}"
  end

  def create_iam_1_factor_login
    ::SecurityData::iam_login_1_factor_response
  end

  def create_iam_2_factor_login
    ::SecurityData::iam_login_2_factor_response
  end

  def create_local_login
    ::SecurityData::local_login_response
  end

  def create_verification
    ::SecurityData::verification_response
  end

end