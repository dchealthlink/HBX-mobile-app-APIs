require_relative 'base_util'

class RidpUtil < BaseUtil
  include Helper

  VERIFY_IDENTITY_JSON = 'identify_verification.json'

  def target_path
    "#{@use_case_directory}/#{VERIFY_IDENTITY_JSON}"
  end

  def create_questions
    ::RidpData::verification_questions
  end

  def create_post_body
    ::RidpData::post_body
  end

end