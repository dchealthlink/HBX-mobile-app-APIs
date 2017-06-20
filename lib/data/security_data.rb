class SecurityData

  class << self

    def iam_login_1_factor_response
      {
        'session_key': '_session_id',
        'session_value': 'naNW3AdRYb30l8himTJBwol9JI4',
        'enroll_server': 'https://enroll-mobile2.dchbx.org',
        'broker_endpoint': 'https://enroll-mobile2.dchbx.org/api/v1/mobile/broker',
        'employer_details_endpoint': 'https://enroll-mobile2.dchbx.org/api/v1/mobile/employer/details',
        'employee_roster_endpoint': 'https://enroll-mobile2.dchbx.org/api/v1/mobile/employees',
        'individual_endpoint': 'https://enroll-mobile2.dchbx.org/api/v1/mobile/insured'
      }
    end


    def iam_login_2_factor_response
      {
        'session_id': 'AklUDJ8VfZzfgfrdufOxCzmlciU',
        'enroll_server': 'https://enroll-mobile2.dchbx.org',
        'broker_endpoint': 'https://enroll-mobile2.dchbx.org/api/v1/mobile/broker',
        'employer_details_endpoint': 'https://enroll-mobile2.dchbx.org/api/v1/mobile/employer/details',
        'employee_roster_endpoint': 'https://enroll-mobile2.dchbx.org/api/v1/mobile/employees',
        'individual_endpoint': 'https://enroll-mobile2.dchbx.org/api/v1/mobile/insured'
      }
    end

    def local_login_response
      {
        'session_key': 'rack.session',
        'session_value': 'BAh7B0kiHHdhcmRlbi51c2VyLmRlZmF1bHQua2V5BjoGRVRJIik2ZTI3YWY1%0AMC0xNzRkLTAxMzUtZjQ1OC0wODYzZGZjN2M3OTkGOwBUSSIPc2Vzc2lvbl9p%0AZAY7AFRJIkViMzk5ODhhMGMwZWQ2OGY4OGI3MjhlODc1NmM1ODEzMzA3MDNl%0AODE2NWZiNDlhNjI0M2JhMTM0MmYzYzYzM2FjBjsARg%3D%3D%0A--6f6986f5e6cd7ea636b3107a96be02256d7c8e5c'
      }
    end

    def verification_response
      {
        'security_question': 'What color was the interior of your first car?'
      }
    end


  end
end