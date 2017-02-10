require_relative 'base_util'
require_relative 'individual_util'

class EmployeeUtil < BaseUtil
  include Helper

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
  end

  def add_roster root_directory, partial_path, employer_details, employer_profile_id
    {
        employer_name: @employer_name,
        roster: @employee_data.each_with_index.map do |e, index|
          employee = create_person e.clone, index
          individual = create_person e, index, false, employer_profile_id, employer_details
          IndividualUtil.create_individual_file root_directory, partial_path, individual
          employee.delete :employments
          employee
        end
    }
  end

  def create_person person, index, employee=true, employer_profile_id=nil, employer_details=nil
    pers = person_details person.first, employee
    pers[:id] = ::EmployeeUtil.roster_example_no * 100 + index
    pers[:employments] = employments person.first, employer_profile_id, employer_details, employee, index unless employee
    pers[:enrollments] = enrollments index, employer_profile_id
    pers[:is_business_owner] = is_business_owner(index, employee) if employee
    pers[:dependents] = person.last.map { |d| person_details(d) }
    pers
  end

  def is_business_owner index, employee
    index == 1
  end

  def employments person, employer_profile_id, employer_details, employee, index
    [
        employer_profile_id: employer_profile_id,
        employer_name: employer_details[:employer_name],
        hired_on: person.split.last,
        is_business_owner: is_business_owner(index, employee)
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
                                                        (index == 1) ? 'FULL-TIME EMPLOYEES' : 'PART-TIME EMPLOYEES')
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