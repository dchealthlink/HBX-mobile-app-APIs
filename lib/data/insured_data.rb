class InsuredData

  class << self

    def insured
      [['male Sammy R. Davis Jr. 1925-12-08 ***-**-6789 2008-12-08',
        ['female Tracey M. Davis Jr. 1965-08-07 ***-**-9909',
         'male Manny D. Davis X 1971-09-09 ***-**-5505']],
       ['male Frank S. Sinatra III 1915-12-12 ***-**-2000 2007-12-12', ['female Tracey M. Davis Jr. 1965-08-07 ***-**-9909',
                                                                        'male Manny D. Davis X 1971-09-09 ***-**-5505']],
       ['male Dean D. Martin Sr. 1917-06-07 ***-**-4566 2012-03-03', []],
       ['female Abigail M. Yates PhD. 1975-12-08 ***-**-6001 2008-10-08',
        ['male Kevin R. Beckman X. 1985-08-07 ***-**-7603']],
       ['female Jillian S. Holtzmann PhD. 1985-11-11 ***-**-2050 2009-11-12', ['female Diotima P. Holtzmann IV 2003-12-19 ***-**-2003']],
       ['female Patty D. Tolan Cdtr 1987-06-06 ***-**-4546 2015-04-03', []],
       ['female Erin S. Gilbert PhD. 1969-03-01 ***-**-4554 2016-01-01', []]]
    end

    def addresses
      [
        {
          kind: 'home',
          address_1: '33 N St NE',
          address_2: '',
          city: 'Washington',
          county: nil,
          state: 'DC',
          location_state_code: nil,
          zip: '20002',
          country_name: ''
        }
      ]
    end

  end
end