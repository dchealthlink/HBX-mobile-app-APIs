module Helper

  class << self
    def write_json content, file_name, is_json=false
      is_json ? File.write(file_name, JSON.pretty_generate(JSON.parse(content))) :
          File.write(file_name, JSON.pretty_generate(content))
    end

    def create_directory path
      FileUtils.rm_rf(Dir.glob("#{path}/*"))
      FileUtils.mkdir_p(path) unless File.directory?(path)
    end

    def account_json
      Jbuilder.encode do |json|
        json.brokers do
          json.array! [
                          Scenarios::BROKER_1, Scenarios::BROKER_EMPTY, Scenarios::BROKER_ROSTER_EMPTY, Scenarios::BROKER_IN_PENDING,
                          Scenarios::BROKER_IN_OE
                      ]
        end
        json.employers do
          json.array! %w{er_roster_empty er_in_open_enrollment er_in_pending}
        end
      end
    end

    def staffer first: 'John', last: 'Doe', phone: '202-468-6571', mobile: '202-468-6571', email: 'john.doe@example.com'
      contact first: first, last: last, phone: phone, mobile: mobile, email: email
    end

    def office first: 'Primary', last: 'Office', phone: '202-468-6571', email: '', address_1: '609 H St. NE',
               address_2: '', city: 'Washington', state: 'DC', zip: '20001'
      contact first: first, last: last, phone: phone, email: email, address_1: address_1, address_2: address_2,
              city: city, state: state, zip: zip
    end

    def contact first: '', last: '', phone: '', mobile: '', email: '', address_1: '', address_2: '', city: '',
                state: '', zip: ''
      {
          first: "#{first}",
          last: "#{last}",
          phone: "#{phone}",
          mobile: "#{mobile}",
          emails: ["#{email}"],
          address_1: "#{address_1}",
          address_2: "#{address_2}",
          city: "#{city}",
          state: "#{state}",
          zip: "#{zip}"
      }
    end
  end

  def now
    Date.parse Time.now.to_s
  end

  def fmt dt
    dt.strftime('%Y-%m-%d') if dt
  end

  def person_details person, hired_on=true
    gender, first, mid, last, sfx, dob, ssn, hired = person.split
    result = {
        first_name: first,
        middle_name: mid,
        last_name: last,
        name_suffix: sfx,
        date_of_birth: dob,
        ssn_masked: ssn,
        gender: gender
    }
    result[:hired_on] = hired if hired && hired_on
    result
  end

  def plan_year_details plan_year, total_employees
    {
        plan_year_begins: fmt(plan_year.plan_year_begins),
        open_enrollment_begins: fmt(plan_year.open_enrollment_begins),
        open_enrollment_ends: fmt(plan_year.end_of_open_enrollment),
        renewal_in_progress: plan_year.in_pending_renewal || plan_year.in_renewal_OE,
        renewal_application_available: fmt(plan_year.renewal_begins),
        renewal_application_due: fmt(plan_year.renewal_deadline),
        state: plan_year.state,
        minimum_participation_required: (total_employees * 2.0 / 3.0).to_i
    }
  end

  def enrollment_for status, total_employees, er_contrib, ee_contrib, benefit_group_name, employer_id=nil
    return unless status
    enrollment = {status: status}
    enroll_waived_or_terminated enrollment, benefit_group_name, ee_contrib, er_contrib, status,
                                total_employees, employer_id if %w{Enrolled Waived Terminated}.include? status
    enrollment
  end

  #
  # Private
  #
  private

  def enroll_waived_or_terminated enrollment, benefit_group_name, ee_contrib, er_contrib, status, total_employees,
                                  employer_id=nil
    er_cost = cost er_contrib, status, total_employees
    ee_cost = cost ee_contrib, status, total_employees

    enrollment[:employer_contribution] = er_cost
    enrollment[:employee_cost] = ee_cost
    enrollment[:total_premium] = (er_cost + ee_cost).round(2)
    enrollment[:plan_name] = 'KP DC Silver 2000/35'
    enrollment[:plan_type] = 'HMO'
    enrollment[:metal_level] = 'Silver'
    enrollment[:benefit_group_name] = benefit_group_name

    if employer_id
      carrier = {
          name: 'Kaiser',
          contact_info: %w{1-800-777-7902 1-888-777-7902},
          terms_and_conditions_url: '/document/download/dchbx-enroll-sbc-preprod/ad954b2b-81ca-4729-b440-811eead43498?content_type=application/pdf&filename=UHCChoicePlusHSAPOSGold1300A.pdf&disposition=inline'
      }
      enrollment[:carrier] = carrier
    end

    if status == 'Terminated'
      enrollment[:terminated_on] = Date.today
      enrollment[:terminate_reason] = 'I have coverage through an individual market health plan'
    end
  end

  def cost contrib, status, total_employees
    (status == 'Enrolled') ? (contrib / total_employees).round(2) : 0.0
  end

end