require_relative 'base_util'
require_relative 'insured_util'

class IndividualUtil < InsuredUtil
  include Helper

  def create_individual_uqhp
    create_individual
  end

  #
  # Private
  #
  private

  def create_individual
    create_person family_data, individual_id, false, enrollments
  end

  def family_data
    pick_from(::InsuredData.insured)
  end

  def individual_id
    pick_from(::BasicData.uids)
  end

  def plan_years
    [PlanYear.in_open_enrollment]
  end

  def enrollments
    plan_years.each_with_index.map do |py, py_index|
      start_on = fmt py.plan_year_begins
      year_enrollment = {start_on: start_on}
      coverage_options.keys.each do |coverage_kind|
        status = pick_from(coverage_options[coverage_kind])
        year_enrollment[coverage_kind] = enrollment_for(status)
      end
      year_enrollment
    end
  end

  def enrollment_for status
    return unless status
    enrollment = {status: status}
    enroll_waived_or_terminated enrollment, status if %w{Enrolled Waived Terminated}.include? status
    enrollment
  end

  def enroll_waived_or_terminated enrollment, status
    enrollment[:total_premium] = cost status
    enrollment[:elected_aptc_pct] = 0
    enrollment[:applied_aptc_amount_in_cents] = 0

    add_plan_details! enrollment
    add_urls! enrollment
    add_terminated! enrollment, status
  end

  def cost status
    (status == 'Enrolled') ? pick_from(100..400).to_f : 0.0
  end


end