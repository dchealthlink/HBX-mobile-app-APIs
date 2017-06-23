class UserExistenceData

  class << self

   def post_body
     {
       'person': {
         'ssn': '121233211',
         'first_name': 'LorenSon',
         'last_name': 'Dimallo',
         'birth_date': '20100305'
       }
     }
   end

    def response
      {
        'ridp_verified': true,
        'primary_applicant': {
          'id': '58bf3bb6e41b0738bf0000ce',
          'user_id': '58bf3b87e41b0738bf0000cc',
          'first_name': 'Loren',
          'last_name': 'Dimallo'
        },
        'employers': [
          {
            'employer': {
              'id': '58bf321ee41b0738bf00000c',
              'legal_name': 'BriCol',
              'phone': '(783) 786-7857'
            },
            'broker': {
              'id': '58c938e2e41b071e74000085',
              'organization_legal_name': 'WilliamBroker',
              'legal_name': 'William Broker',
              'phone': '(324) 534-4562'
            }
          },
          {
            'employer': {
              'id': '58c6fd03e41b07562c000072',
              'legal_name': 'DevelopmentER',
              'phone': '(876) 786-7867'
            }
          }
        ],
        'token': 'fjo7+i44H+OdmIE2gfGBajDsJmqpQPBfaV89c758Kn/3SpC1I0fH/wYU4xjJ\nB+lQSkAj2fabgi9aPJt3QfNjlA4gk9g6D/SNKuV2yFybqvBMDXNeOR0f9PIO\nLW7qD6KETkGcATP/8p8+KPUXXukQjNEaBmdTKRVCfHhRuXtUgam9Qp+L+2yf\nnb6D6BejNU/fWUQXqlCtynYbGc+v7shdVPZxiwmSsY9Y/hXejdrwX5gicPvp\nU8wals3Jdfg+f2Za4gymO0CV0lRvxloVTvr/NDjt1Mz8BZvtFFHP4wNa9xE9\ngUZxAs+siWRIw8znLd776SXilzJrnbGzA011URCaXw==\n'
      }
    end

  end
end