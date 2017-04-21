require_relative 'base_util'

class RidpUtil < BaseUtil
  include Helper

  VERIFY_IDENTITY_JSON = 'verify_identity.json'

  def target_path
    "#{@use_case_directory}/#{VERIFY_IDENTITY_JSON}"
  end

  def create_questions
    ::RidpData::verification_questions
  end

  def create_post_body
    ::RidpData::post_body
  end

  def create_answer_questions
    ::RidpData::answer_questions
  end

  def create_user_exists_in_enroll_SHOP
    ::RidpData::user_exists_in_enroll_SHOP
  end

  def create_user_exists_in_enroll_IVL
    ::RidpData::user_exists_in_enroll_IVL
  end

  def create_user_not_in_enroll
    ::RidpData::user_not_in_enroll
  end

  def create_ridp_verification_failure
    ::RidpData::verification_final_error_response
  end

end