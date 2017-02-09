require_relative 'base_util'

class IndividualUtil < BaseUtil
  include Helper

  @@individual_example_no = 0

  class << self
    def create_individual root_directory, partial_path, content
      Helper::write_json content, individual_path(root_directory)
      url = url individual_path(partial_path)
      @@individual_example_no += 1
      url
    end

    def individual_example_no
      @@individual_example_no
    end

    def individual_example_no= value
      @@individual_example_no = value
    end

    def individual_path root_directory
      "#{root_directory}/individual_#{@@individual_example_no}.json"
    end

  end
end