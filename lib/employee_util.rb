require_relative 'base_util'

class EmployeeUtil < BaseUtil
  include Helper

  @@roster_example_no = 0

  class << self
    def create_employee_roster content
      path = "#{BaseUtil::DIR_GENERATED}/broker_1/roster_#{@@roster_example_no}.json"
      Helper::write_json content, path, "#{__dir__}/.."
      @@roster_example_no += 1
      url path
    end

    def roster_example_no
      @@roster_example_no
    end
  end

  def add_roster
    {
        employer_name: @employer_name,
        roster: @employee_data.each_with_index.map do |e, index|
          employee = person_details e.shift
          employee[:id] = ::EmployeeUtil.roster_example_no * 100 + index
          employee[:enrollments] = enrollments index
          employee[:is_business_owner] = (index == 1) #Frank is the Chairman of the Board
          employee[:dependents] = e.shift.map { |d| person_details(d) }
          employee
        end
    }
  end

  def enrollments index
    @plan_years.each_with_index.map do |py, py_index|
      start_on = fmt py.plan_year_begins
      year_enrollment = {start_on: start_on}
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

  def er_contrib enrolled, waived
    (enrolled * 770.00 * ((waived + 1) ** 0.22)).round(2)
  end

  def ee_contrib enrolled, waived
    (enrolled * 425.00 * ((waived + 1) ** 0.2)).round(2)
  end

  private :er_contrib, :ee_contrib

end