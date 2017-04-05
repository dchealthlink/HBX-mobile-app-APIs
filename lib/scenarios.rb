class Scenarios < BaseUtil

  BROKER_1 = 'broker_1'
  BROKER_EMPTY = 'broker_empty'
  BROKER_IN_OE = 'broker_er_in_open_enrollment'
  BROKER_IN_PENDING = 'broker_er_in_pending'
  BROKER_ROSTER_EMPTY = 'broker_er_roster_empty'
  EMPLOYEE = 'employee'
  INDIVIDUAL_APTC = 'individual_aptc'
  INDIVIDUAL_UQHP = 'individual_uqhp'
  SERVICES = 'services'
  PLANS_UQHP_SINGLE = 'plans_for_uqhp_single'
  PLANS_UQHP_FAMILY = 'plans_for_uqhp_family'
  PLANS_CSR_FAMILY = 'plans_for_family_receiving_csr'
  RIDP = 'ridp'

  class << self

    # Create accounts
    def create_accounts
      Helper::write_json Helper::account_json, "#{$ROOT_DIRECTORY}/accounts.json"
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
        employee_util.set_values(*::ClientData.client_A)
        write_json employee_util.create_single_employee, employee_util
      end
    end

    # Create individual insured with UQHP
    def create_individual_uqhp
      individual_util INDIVIDUAL_UQHP do |individual_util|
        reset_count
        write_json individual_util.create_individual_uqhp, individual_util
      end
    end

    # Create individual insured with APTC
    def create_individual_aptc
      individual_util INDIVIDUAL_APTC do |individual_util|
        reset_count
        write_json individual_util.create_individual_aptc, individual_util
      end
    end

    # Create services rates
    def create_services_rates
      services_util SERVICES do |services_util|
        write_json services_util.create_services_rates, services_util
      end
    end

    # Create plans
    def create_plans_for_uqhp_single
      plans_util PLANS_UQHP_SINGLE do |plans_util|
        write_json plans_util.create_plans_for(1), plans_util
      end
    end

    def create_plans_for_uqhp_family
      plans_util PLANS_UQHP_FAMILY do |plans_util|
        write_json plans_util.create_plans_for(3), plans_util
      end
    end

    def create_plans_for_csr_family
      plans_util PLANS_CSR_FAMILY do |plans_util|
        write_json plans_util.create_valid_csr_plans_for(3), plans_util
      end
    end

    def create_identity_questions
      ridp_util RIDP do |ridp_util|
        write_json ridp_util.create_questions, ridp_util
        write_json ridp_util.create_post_body, nil, "#{$ROOT_DIRECTORY}/#{RIDP}", 'post_body.json'
      end
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
      yield BrokerUtil.new use_case_directory: create_directory(use_case_dir), partial_path: "#{$GENERATED_DIR}/#{use_case_dir}"
    end

    def employee_util use_case_dir
      yield EmployeeUtil.new use_case_directory: create_directory(use_case_dir), partial_path: "#{$GENERATED_DIR}/#{use_case_dir}"
    end

    def individual_util use_case_dir
      yield IndividualUtil.new use_case_directory: create_directory(use_case_dir), partial_path: "#{$GENERATED_DIR}/#{use_case_dir}"
    end

    def services_util use_case_dir
      yield ServiceUtil.new use_case_directory: create_directory(use_case_dir), partial_path: "#{$GENERATED_DIR}/#{use_case_dir}"
    end

    def plans_util use_case_dir
      yield PlanUtil.new use_case_directory: create_directory(use_case_dir), partial_path: "#{$GENERATED_DIR}/#{use_case_dir}"
    end

    def ridp_util use_case_dir
      yield RidpUtil.new use_case_directory: create_directory(use_case_dir), partial_path: "#{$GENERATED_DIR}/#{use_case_dir}"
    end

    def write_json content, util=nil, override_dir=nil, override_filename=nil
      util ? Helper::write_json(content, "#{util.target_path}") :
        Helper::write_json(content, "#{override_dir}/#{override_filename}", false)
    end

  end
end