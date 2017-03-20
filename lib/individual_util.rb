require_relative 'base_util'
require_relative 'insured_util'

class IndividualUtil < InsuredUtil
  include Helper

  def create_individual_uqhp
    create_individual
  end

   def create_individual_aptc
    create_individual (pick_from_range(25..75).to_f / 100)
  end

  #
  # Private
  #
  private

  def create_individual elected_aptc_pct = 0.0
    create_person family_data, individual_id, false, (enrollments elected_aptc_pct)
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

  def enrollments elected_aptc_pct
    plan_years.each_with_index.map do |py, py_index|
      start_on = fmt py.plan_year_begins
      year_enrollment = {start_on: start_on}
      coverage_options.keys.each do |coverage_kind|
        status = pick_from(coverage_options[coverage_kind])
        year_enrollment[coverage_kind] = enrollment_for(status, elected_aptc_pct)
      end
      year_enrollment
    end
  end

  def enrollment_for status, elected_aptc_pct
    return unless status
    enrollment = {status: status}
    enroll_waived_or_terminated enrollment, status, elected_aptc_pct if %w{Enrolled Waived Terminated}.include? status
    enrollment
  end

  def enroll_waived_or_terminated enrollment, status, elected_aptc_pct
    total_premium = cost status
    enrollment[:total_premium] = total_premium
    enrollment[:plan_name] = 'KP DC Silver 2000/35'
    enrollment[:plan_type] = 'HMO'
    enrollment[:metal_level] = 'Silver'
    enrollment[:elected_aptc_pct] = elected_aptc_pct
    enrollment[:applied_aptc_amount_in_cents] = (elected_aptc_pct * total_premium).round(2)

    enrollment[:carrier] = {
        name: 'Kaiser',
        summary_of_benefits_url: '/document/download/dchbx-enroll-sbc-preprod/ad954b2b-81ca-4729-b440-811eead43498?content_type=application/pdf&filename=UHCChoicePlusHSAPOSGold1300A.pdf&disposition=inline'
    }

    enrollment[:provider_directory_url] = 'http://mydoctor.kaiserpermanente.org/mas/mdo/?kp_shortcut_referrer=kp.org/doctor'
    enrollment[:rx_formulary_url] = 'https://healthy.kaiserpermanente.org/static/health/pdfs/formulary/mid/mid_exchange_formulary.pdf'
    enrollment[:services_rates_url] = BaseUtil::url "#{$GENERATED_DIR}/#{ServiceUtil::SERVICES_RATE_JSON}"

    if status == 'Terminated'
      enrollment[:terminated_on] = Date.today
      enrollment[:terminate_reason] = 'I have coverage through an individual market health plan'
    end
  end

  def cost status
    (status == 'Enrolled') ? pick_from_range(100..400).to_f : 0.0
  end


end