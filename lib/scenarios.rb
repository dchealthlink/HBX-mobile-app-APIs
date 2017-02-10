class Scenarios < BaseUtil

  BROKER_1 = 'broker_1'
  BROKER_EMPTY = 'broker_empty'
  BROKER_IN_OE = 'broker_er_in_open_enrollment'
  BROKER_IN_PENDING = 'broker_er_in_pending'
  BROKER_ROSTER_EMPTY = 'broker_er_roster_empty'

  class << self

    # Create accounts
    def create_accounts
      write_json Helper::account_json, nil, $ROOT_DIRECTORY, 'accounts.json'
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

    #
    # Private
    #
    private

    def reset_count
      EmployeeUtil.roster_example_no = EmployerUtil.details_example_no = IndividualUtil.individual_example_no = 0
    end

    def broker_util broker_dir
      puts "# Creating #{broker_dir}"
      full_path = "#{$ROOT_DIRECTORY}/#{broker_dir}"
      Helper::create_directory full_path
      yield BrokerUtil.new broker_directory: full_path, partial_path: "#{$GENERATED_DIR}/#{broker_dir}"
    end

    def write_json content, broker_util=nil, override_dir=nil, override_filename=nil
      broker_util ? Helper::write_json(content, "#{broker_util.broker_directory}/#{$BROKER_FILE_NAME}") :
          Helper::write_json(content, "#{override_dir}/#{override_filename}", true)
    end

  end
end