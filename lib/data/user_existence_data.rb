class UserExistenceData

  class << self

    def user_existence
      {
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
              legal_name: 'WilliamBroker',
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
        ]
      }
    end

    def post_body
      {
        person_demographics: {
          ssn: '121233211'
        }
      }
    end

  end
end