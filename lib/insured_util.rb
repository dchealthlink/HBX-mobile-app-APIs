require_relative 'base_util'

class InsuredUtil < BaseUtil
	include Helper

  @@insured_example_no = 0

  class << self
    def create_insured_file root_directory, partial_path, content
      Helper::write_json content, insured_path(root_directory)
      url = url insured_path(partial_path)
      @@insured_example_no += 1
      url
    end

    def insured_example_no
      @@insured_example_no
    end

    def insured_example_no= value
      @@insured_example_no = value
    end

    def insured_path root_directory
      "#{root_directory}/insured_#{@@insured_example_no}.json"
    end

  end

end