require_relative 'base_util'

class UserExistenceUtil < BaseUtil
  include Helper

  RESPONSE_JSON = 'user_existence.json'

  def target_path
    "#{@use_case_directory}/#{RESPONSE_JSON}"
  end

  def create_user_existence
    ::UserExistenceData::user_existence
  end

  def create_post_body
    ::UserExistenceData::post_body
  end

end