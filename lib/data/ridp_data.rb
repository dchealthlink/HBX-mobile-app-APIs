class RidpData

  class << self

    def verification_final_error_response
      {
        verification_result: {
          response_code: 'urn:openhbx:terms:v1:interactive_identity_verification#FAILURE',
          response_text: 'Failed response - please see ref below.',
          transaction_id: '5cef-7a-2d4e'
        },
        session: nil,
        ridp_verified: false
      }
    end

    def user_exists_in_enroll_IVL
      {
        ridp_verified: true,
        user_found_in_enroll: true
      }
    end

    def user_not_in_enroll
      {
        ridp_verified: true,
        user_found_in_enroll: false,
        token: 'OCd1eTQLsl+y4D3EU9ke1TbHkwT/NcbURkJEIj901aW2P0bGMqcxvOlyBdKB\nnmpHLyqBvFzweKeLqWkdu3P1pIG4J6kSFBbg3tEzsLPRA4u5E3Hosskh0TEN\n/xthnL4nJ7D0divNPqU6RMT+0F8A71qcR5Q4BCH1UsJyHce5BHeU6aR1Vrwi\nWpMjw4u0xUC2QKN9vn5x+W+3y5GgpS20YdojuIShs9PkN8O3I4zIKwSa5JBM\nYfLDD755tVn76dmYF7zXlVHaVLQR/aSwhAlz0PPc2pGuMXWt32F1JpdVLPAm\noIg5W+6fWn5jQVMquszMM7wM1F2H+ywjd6CAKngcGA==\n'
      }
    end

    def user_exists_in_enroll_SHOP
      {
        ridp_verified: true,
        primary_applicant: {
          id: '58bf3bb6e41b0738bf0000ce',
          user_id: '58bf3b87e41b0738bf0000cc',
          first_name: 'Loren',
          last_name: 'Dimallo'
        },
        employers: [
          {
            employer: {
              id: '58bf321ee41b0738bf00000c',
              legal_name: 'BriCol',
              phone: '(783) 786-7857'
            },
            broker: {
              id: '58c938e2e41b071e74000085',
              organization_legal_name: 'WilliamBroker',
              legal_name: 'William Broker',
              phone: '(324) 534-4562'
            }
          },
          {
            employer: {
              id: '58c6fd03e41b07562c000072',
              legal_name: 'DevelopmentER',
              phone: '(876) 786-7867'
            }
          }
        ],
        token: 'OCd1eTQLsl+y4D3EU9ke1TbHkwT/NcbURkJEIj901aW2P0bGMqcxvOlyBdKB\nnmpHLyqBvFzweKeLqWkdu3P1pIG4J6kSFBbg3tEzsLPRA4u5E3Hosskh0TEN\n/xthnL4nJ7D0divNPqU6RMT+0F8A71qcR5Q4BCH1UsJyHce5BHeU6aR1Vrwi\nWpMjw4u0xUC2QKN9vn5x+W+3y5GgpS20YdojuIShs9PkN8O3I4zIKwSa5JBM\nYfLDD755tVn76dmYF7zXlVHaVLQR/aSwhAlz0PPc2pGuMXWt32F1JpdVLPAm\noIg5W+6fWn5jQVMquszMM7wM1F2H+ywjd6CAKngcGA==\n'
      }
    end

    def answer_questions
      {
        'person': {
          'ssn': '121233212',
          'first_name': 'LorenSon',
          'last_name': 'Dimallo',
          'birth_date': '20100305'
        },
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