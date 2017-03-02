require_relative 'base_util'
require_relative 'insured_util'

class EmployeeUtil < BaseUtil
  include Helper

  def initialize args={}
    super args
    fixed_shuffler = Random.new(@employer_name.length)
    @employee_data = ::Sample.insured.shuffle(random: fixed_shuffler).take @total_employees
  end

  @@roster_example_no = 0

  class << self
    def create_employee_roster_file root_directory, partial_path, content
      Helper::write_json content, roster_path(root_directory)
      url = url roster_path(partial_path)
      @@roster_example_no += 1
      url
    end

    def roster_example_no
      @@roster_example_no
    end

    def roster_example_no= value
      @@roster_example_no = value
    end

    def roster_path root_directory
      "#{root_directory}/roster_#{@@roster_example_no}.json"
    end

    def create_single_employee_of employee_id, root_directory, partial_path, employer_profile_id, employer_name
      util = EmployeeUtil.new(employer_name: employer_name, employer_profile_id: employer_profile_id, 
        total_employees: 1)
      util.create_single_employee root_directory, partial_path
    end
  end

  def add_roster root_directory, partial_path, employer_details, employer_profile_id
    {
        employer_name: @employer_name,
        roster: @employee_data.each_with_index.map do |e, index|
          employee_id = (::EmployeeUtil.roster_example_no * 100 + index)
          
          #TODO REMOVE
          insured = create_employee e, employee_id, index, employer_profile_id, employer_details[:employer_name]
          InsuredUtil.create_insured_file root_directory, partial_path, insured
          #TODO END REMOVE  

          create_employee e.clone, employee_id, index
        end
    }
  end

  def create_single_employee root_directory, partial_path
      insured = create_employee @employee_data.first, @@insured_example_no, 1, @employer_profile_id, @employer_name
      InsuredUtil.create_insured_file root_directory, partial_path, insured
  end      

  def create_employee person, employee_id, index, employer_profile_id=nil, employer_name=nil
    pers = create_person person, employee_id, true, (enrollments index, employer_profile_id)
    if employer_name && employer_profile_id
      pers[:employments] = employments person.first, employer_profile_id, employer_name, index
    end
    pers[:is_business_owner] = is_business_owner(index) 
    pers
  end 

  def create_person person, id, include_hired_on=true, enrollments=nil
    pers = person_details person.first, include_hired_on
    pers[:id] = id
    pers[:enrollments] = enrollments
    pers[:dependents] = person.last.map { |d| person_details(d) }
    pers
  end

  def is_business_owner index
    index == 1
  end

  def employments person, employer_profile_id, employer_name, index
    [
        employer_profile_id: employer_profile_id,
        employer_name: employer_name,
        hired_on: person.split.last,
        is_business_owner: is_business_owner(index)
    ]
  end

  def enrollments index, employer_id=nil
    @plan_years.each_with_index.map do |py, py_index|
      start_on = fmt py.plan_year_begins
      year_enrollment = enrollment_hash employer_id, start_on
      @coverage_options.keys.each do |coverage_kind|
        which = (index + py_index + @employer_name.length) % @coverage_options[:health].length
        status = @coverage_options[coverage_kind][which]
        year_enrollment[coverage_kind] = enrollment_for(status,
                                                        @total_employees,
                                                        er_contrib(@enrolled, @waived),
                                                        ee_contrib(@enrolled, @waived),
                                                        (index == 1) ? 'FULL-TIME EMPLOYEES' : 'PART-TIME EMPLOYEES',
                                                        employer_id)
      end
      year_enrollment
    end
  end

  #
  # Private
  #
  private

  def enrollment_hash employer_id, start_on
    enrollment = {}
    enrollment.merge! employer_profile_id: employer_id if employer_id
    enrollment.merge! start_on: start_on
    enrollment
  end

  def er_contrib enrolled, waived
    (enrolled * 770.00 * ((waived + 1) ** 0.22)).round(2)
  end

  def ee_contrib enrolled, waived
    (enrolled * 425.00 * ((waived + 1) ** 0.2)).round(2)
  end

end