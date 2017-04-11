class RidpData

  class << self

    def verification_final_response
      {
        'verification_result': {
          'response_code': 'urn:openhbx:terms:v1:interactive_identity_verification#SUCCESS',
          'response_text': 'HS000000 Successful',
          'transaction_id': '5cef-7a-2d4e'
        },
        'session': nil
      }
    end

    def answer_questions
      {
        'session_id': 'AB783917E63E4CA345448C600928D632.pidd1v-1304180857460210166972210',
        'transaction_id': 'c5f1-52-3a57',
        'question_response': [
          {
            'question_id': '1',
            'answer': {
              'response_id': '1',
              'response_text': 'AUGUSTA'
            }
          },
          {
            'question_id': '2',
            'answer': {
              'response_id': '1',
              'response_text': '1965 to 1974'
            }
          },
          {
            'question_id': '3',
            'answer': {
              'response_id': '1',
              'response_text': 'HIGH SCHOOL DIPLOMA'
            }
          },
          {
            'question_id': '4',
            'answer': {
              'response_id': '1',
              'response_text': '2'
            }
          }
        ]
      }
    end

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
          'transaction_id': 'c5f1-52-3a57',
          'session_id': 'AB783917E63E4CA345448C600928D632.pidd1v-1304180857460210166972210',
          'questions': [
            {
              'question_id': '1',
              'question_text': 'You currently or previously resided on one of the following streets. Please select the street name from the following choices.',
              'response_options': [
                {
                  'response_id': '1',
                  'response_text': 'AUGUSTA'
                },
                {
                  'response_id': '2',
                  'response_text': 'FALMOUTH HEIGHTS'
                },
                {
                  'response_id': '3',
                  'response_text': 'GOETHALS'
                },
                {
                  'response_id': '4',
                  'response_text': 'HARRISON'
                },
                {
                  'response_id': '5',
                  'response_text': 'NONE OF THE ABOVE'
                }
              ]
            },
            {
              'question_id': '2',
              'question_text': 'Please select the range that includes the year the home was built for the address that you provided.',
              'response_options': [
                {
                  'response_id': '1',
                  'response_text': '1965 to 1974'
                },
                {
                  'response_id': '2',
                  'response_text': '1975 to 1984'
                },
                {
                  'response_id': '3',
                  'response_text': '1985 to 1994'
                },
                {
                  'response_id': '4',
                  'response_text': '1995 to 2004'
                },
                {
                  'response_id': '5',
                  'response_text': 'NONE OF THE ABOVE'
                }
              ]
            },
            {
              'question_id': '3',
              'question_text': "Which of the following is the highest level of education you have completed?  If there is not a matched educational level, please select 'NONE OF THE ABOVE'.",
              'response_options': [
                {
                  'response_id': '1',
                  'response_text': 'HIGH SCHOOL DIPLOMA'
                },
                {
                  'response_id': '2',
                  'response_text': 'SOME COLLEGE'
                },
                {
                  'response_id': '3',
                  'response_text': 'BACHELOR DEGREE'
                },
                {
                  'response_id': '4',
                  'response_text': 'GRADUATE DEGREE'
                },
                {
                  'response_id': '5',
                  'response_text': 'NONE OF THE ABOVE'
                }
              ]
            },
            {
              'question_id': '4',
              'question_text': "Please select the number of bedrooms in your home from then following choices. If the number of bedrooms in your home is not one of the choices please select 'NONE OF THE ABOVE'.",
              'response_options': [
                {
                  'response_id': '1',
                  'response_text': '2'
                },
                {
                  'response_id': '2',
                  'response_text': '3'
                },
                {
                  'response_id': '3',
                  'response_text': '4'
                },
                {
                  'response_id': '4',
                  'response_text': '5'
                },
                {
                  'response_id': '5',
                  'response_text': 'NONE OF THE ABOVE'
                }
              ]
            }
          ]
        }
      }
    end


  end
end