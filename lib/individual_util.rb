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
    pick_from(::Sample.insured)
  end

  def individual_id
    pick_from(::Sample.uids)
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
    enrollment[:plan_name] = 'KP DC Silver 2000/35'
    enrollment[:plan_type] = 'HMO'
    enrollment[:metal_level] = 'Silver'

    enrollment[:carrier] = {
        name: 'Kaiser',
        summary_of_benefits_url: '/document/download/dchbx-enroll-sbc-preprod/ad954b2b-81ca-4729-b440-811eead43498?content_type=application/pdf&filename=UHCChoicePlusHSAPOSGold1300A.pdf&disposition=inline'
    }

    if status == 'Terminated'
      enrollment[:terminated_on] = Date.today
      enrollment[:terminate_reason] = 'I have coverage through an individual market health plan'
    end
  end

  def cost status
    (status == 'Enrolled') ? pick_from(100..400).to_f : 0.0
  end


end