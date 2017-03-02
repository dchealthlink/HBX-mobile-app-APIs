require_relative 'employee_util'
require_relative 'employer_util'
require_relative 'data/sample'

class BrokerUtil < BaseUtil
  include Helper

  def target_path
    "#{@use_case_directory}/#{::Helper.broker_endpoint_filename}"
  end

  def create_broker
    ::Sample.broker_basics.merge(
        {
            broker_clients: [participation(*::Sample.client_A), participation(*::Sample.client_B), participation(*::Sample.client_C),
                             participation(*::Sample.client_D), participation(*::Sample.client_E), participation(*::Sample.client_F),
                             participation(*::Sample.client_G), participation(*::Sample.client_H), participation(*::Sample.client_I),
                             participation(*::Sample.client_J), participation(*::Sample.client_K)
            ]
        })
  end

  def create_empty_broker
    ::Sample.broker_basics.merge({broker_clients: []})
  end

  def create_broker_er_in_open_enrollment
    ::Sample.broker_basics.merge({broker_clients: [participation(*::Sample.client_B)]})
  end

  def create_broker_er_in_pending
    ::Sample.broker_basics.merge({broker_clients: [participation(*::Sample.client_K)]})
  end

  #
  # Private
  #
  private

  #TODO(Ben): "total" parameter does not appear to be used.
  def participation employer_name, employer_id, total, enrolled, waived, plan_years, contacts
    total_employees = total_employees employer_name
    summary = summary_details employer_name, total_employees
    employer_details = summary.clone
    employer_util = ::EmployerUtil.new details: employer_details, plan_years: plan_years, total_employees: total_employees
    employer_util.add_plan_details

    employee_util = ::EmployeeUtil.new use_case_directory: @use_case_directory,
                                       employer_name: employer_name, 
                                       enrolled: enrolled, plan_years: plan_years,
                                       total_employees: total_employees, waived: waived
    roster = employee_util.add_roster employer_details, employer_id
    add_to_summary contacts, employer_util, plan_years, roster, summary, total_employees
    summary
  end

  def total_employees employer_name
    @total_employees = 3 + (employer_name.length % 4)
  end

  def summary_details employer_name, total_employees
    {
        employer_name: employer_name,
        binder_payment_due: nil,
        billing_report_date: fmt(now >> 1),
        active_general_agency: (total_employees < 5) ? nil : 'Betadyne General Agency, Inc.',
    }
  end

  def add_to_summary contacts, employer_util, plan_years, roster, summary, total_employees
    summary[:employees_total] = total_employees
    add_plan_years plan_years, roster, summary, total_employees

    summary[:employer_details_url] = ::EmployerUtil.create_employer_details_file @use_case_directory, @partial_path, employer_util.details
    summary[:employee_roster_url] = ::EmployeeUtil.create_employee_roster_file @use_case_directory, @partial_path, roster
    summary[:contact_info] = contacts
  end

  def add_plan_years plan_years, roster, summary, total_employees
    summary[:plan_years] = plan_years.map { |py| plan_year_details(py, total_employees) }
    summary[:plan_years].each do |py|
      coverages = roster[:roster].map do |ee|
        c = ee[:enrollments].detect { |enr| enr[:start_on] == py[:plan_year_begins] }
        c[:health] if c
      end.compact

      enrolled, waived, terminated = %w{Enrolled Waived Terminated}.map do |status|
        coverages.count { |e| e[:status] == status }
      end

      py[:employees_enrolled] = enrolled
      py[:employees_waived] = waived
      py[:employees_terminated] = terminated
    end
  end

end