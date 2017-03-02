class Scenarios < BaseUtil

  BROKER_1 = 'broker_1'
  BROKER_EMPTY = 'broker_empty'
  BROKER_IN_OE = 'broker_er_in_open_enrollment'
  BROKER_IN_PENDING = 'broker_er_in_pending'
  BROKER_ROSTER_EMPTY = 'broker_er_roster_empty'
  EMPLOYEE = 'employee'
  INDIVIDUAL_APTC = 'individual_aptc'

  class << self

    # Create accounts - this doesn't write to accounts.json directly because it would overwrite things that got added via templates
    def create_accounts
      Helper::write_json Helper::account_json, "#{$ROOT_DIRECTORY}/accounts.json.to.merge"
    end

    # Create broker 1
    def create_broker_1
      broker_util BROKER_1 do |broker_util|
        write_json broker_util.create_broker, broker_util
      end
    end

    # Create empty broker
    def create_empty_broker
      broker_util BROKER_EMPTY do |broker_util|
        write_json broker_util.create_empty_broker, broker_util
      end
    end

    # Create broker in open enrollment
    def create_broker_er_in_open_enrollment
      broker_util BROKER_IN_OE do |broker_util|
        reset_count
        write_json broker_util.create_broker_er_in_open_enrollment, broker_util
      end
    end

    # Create broker in pending
    def create_broker_er_in_pending
      broker_util BROKER_IN_PENDING do |broker_util|
        reset_count
        write_json broker_util.create_broker_er_in_pending, broker_util
      end
    end

# Create employee insured
    def create_employee
      employee_util EMPLOYEE do |employee_util|
        reset_count
        employee_util.set_employer_values(*::Sample.client_A)
        write_json employee_util.create_single_employee, employee_util 
      end
    end

# Create individual insured with APTC
    def create_individual_aptc
    end

    #
    # Private
    #
    private

    def reset_count
      EmployeeUtil.roster_example_no = EmployerUtil.details_example_no = InsuredUtil.insured_example_no = 0
    end

    def create_directory use_case_dir
      puts "# Creating #{use_case_dir}"
      Helper::create_directory "#{$ROOT_DIRECTORY}/#{use_case_dir}"
    end

    def broker_util use_case_dir
      yield BrokerUtil.new use_case_directory: (create_directory use_case_dir), partial_path: "#{$GENERATED_DIR}/#{use_case_dir}"
    end

    def employee_util use_case_dir
      yield EmployeeUtil.new use_case_directory: (create_directory use_case_dir), partial_path: "#{$GENERATED_DIR}/#{use_case_dir}"
    end

    def write_json content, util=nil, override_dir=nil, override_filename=nil
      util ? Helper::write_json(content, "#{util.target_path}") :
          Helper::write_json(content, "#{override_dir}/#{override_filename}", true)
    end

  end
end