require_relative 'base_util'

class EmployerUtil < BaseUtil
  include Helper
  attr_accessor :details

  @@details_example_no = 0

  class << self
    def create_employer_details root_directory, partial_path, content
      Helper::write_json content, employer_details_path(root_directory)
      url = url employer_details_path(partial_path)
      @@details_example_no += 1
      url
    end

    def details_example_no
      @@details_example_no
    end

    def details_example_no= value
      @@details_example_no = value
    end

    def employer_details_path root_directory
      "#{root_directory}/employer_details_#{@@details_example_no}.json"
    end
  end

  def add_plan_details
    @details[:plan_years] = @plan_years.map { |py| plan_year_details(py, @total_employees) }
    @details[:plan_years].each_with_index do |py, plan_year_index|
      py[:plan_offerings] =
          ['FULL-TIME EMPLOYEES', 'PART-TIME EMPLOYEES'].each_with_index.map do |group_name, group_name_index|
            {
                benefit_group_name: group_name,
                eligibility_rule: 'First of the month following or coinciding with date of hire',
                health: health_plan((group_name_index * -10), plan_year_index),
                dental: dental_plan(plan_year_index)
            }
          end
    end
  end

  #
  # Private
  #
  private

  def health_plan group_difference, plan_year_index
    plan_year_index == 0 ? ::Sample.health_plan_A(group_difference) : ::Sample.health_plan_B(group_difference)
  end

  def dental_plan plan_year_index
    {
        reference_plan_name: 'BlueDental Preferred',
        reference_plan_HIOS_id: '94506DC0350009-01',
        carrier_name: 'CareFirst',
        plan_type: 'PPO',
        plan_option_kind: 'single_plan',
        plans_by: 'Custom (3 Plans)',
        plans_by_summary_text: 'Custom (3 Plans)',
        elected_dental_plans: [
            {carrier_name: 'CareFirst', plan_name: 'BlueDental Preferred '},
            {carrier_name: 'CareFirst', plan_name: 'BlueDental Traditional'},
            {carrier_name: 'Delta Dental ', plan_name: 'Delta Dental PPO Basic Plan for  Families for Small Businesses '}
        ],
        employer_contribution_by_relationship: {
            employee: 80,
            spouse: 70,
            domestic_partner: 60,
            child_under_26: 50
        },
        estimated_employer_max_monthly_cost: 2000,
        estimated_plan_participant_min_monthly_cost: 92,
        estimated_plan_participant_max_monthly_cost: 54
    } if plan_year_index == 0
  end

end