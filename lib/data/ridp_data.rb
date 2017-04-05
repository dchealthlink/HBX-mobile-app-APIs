class RidpData

  class << self

    def post_body
      {
        'person': {
          'person_name': {
            'person_surname': 'someLastName',
            'person_given_name': 'someFirstName'
          },
          'addresses': [
            {
              'address': {
                'type': 'home',
                'address_line_1': 'Street name',
                'location_city_name': 'City',
                'location_state_code': 'TX',
                'postal_code': '11111'
              }
            }
          ],
          'emails': [
            {
              'email': {
                'type': 'home',
                'email_address': 'some@some.com'
              }
            }
          ]
        },
        'person_demographics': {
          'ssn': '123456789',
          'sex': 'male',
          'birth_date': '19990101',
          'is_incarcerated': 'false',
          'created_at': '2017-03-30T02:53:26Z',
          'modified_at': '2017-03-30T02:53:26Z'
        }
      }
    end

    def verification_questions
      {
        'verification_result': nil,
        'session': {
          'response_code': 'urn:openhbx:terms:v1:interactive_identity_verification#MORE_INFORMATION_REQUIRED',
          'transaction_id': 'transaction id for reference',
          'session_id': 'session id for reference',
          'questions': [
            {
              'question_id': 'First Question',
              'question_text': 'If you had to answer a question',
              'response_options': [
                {
                  'response_id': 'A',
                  'response_text': 'pick answer A'
                },
                {
                  'response_id': 'B',
                  'response_text': 'pick answer B'
                }
              ]
            },
            {
              'question_id': 'Second Question',
              'question_text': 'If somehow there was another question',
              'response_options': [
                {
                  'response_id': 'C',
                  'response_text': 'pick answer C'
                },
                {
                  'response_id': 'D',
                  'response_text': 'pick answer D'
                }
              ]
            }
          ]
        }
      }
    end


  end
end