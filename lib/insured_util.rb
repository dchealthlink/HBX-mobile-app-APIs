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

  def target_path
    "#{@use_case_directory}/#{::Helper.insured_endpoint_filename}"
  end

  def create_person person, id, include_hired_on=true, enrollments=nil
    pers = person_details person.first, include_hired_on
    pers[:id] = id
    pers[:addresses] = addresses
    pers[:enrollments] = enrollments
    pers[:dependents] = person.last.map { |d| person_details(d) }
    pers
  end

  def coverage_options
    {
        health: ['Enrolled', 'Waived', 'Terminated', 'Not Enrolled'],
        dental: ['Enrolled', 'Not Enrolled']
    }
  end

  #
  # Protected
  #
  protected

  def is_business_owner index=1
    index == 1
  end

  def addresses
    [
        {
            kind: 'home',
            address_1: '33 N St NE',
            address_2: '',
            city: 'Washington',
            county: nil,
            state: 'DC',
            location_state_code: nil,
            zip: '20002',
            country_name: ''
        }
    ]
  end

  def employments person, employer_profile_id, employer_name, index=1
    [
        employer_profile_id: employer_profile_id,
        employer_name: employer_name,
        hired_on: person.split.last,
        is_business_owner: is_business_owner(index)
    ]
  end

end