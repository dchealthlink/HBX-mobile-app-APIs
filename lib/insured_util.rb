require_relative 'base_util'

class InsuredUtil < BaseUtil
	include Helper

  @@insured_example_no = 0

  def target_path
    print "the InsuredUtil use case directory is [#{@use_case_directory}]"
    "#{@use_case_directory}/#{::Helper.insured_endpoint_filename}"
  end

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

  def create_person person, id, include_hired_on=true, enrollments=nil
    pers = person_details person.first, include_hired_on
    pers[:id] = id
    pers[:enrollments] = enrollments
    pers[:dependents] = person.last.map { |d| person_details(d) }
    pers
  end

end