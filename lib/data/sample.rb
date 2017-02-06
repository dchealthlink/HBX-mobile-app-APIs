class Sample

  class << self

    def broker_basics
      {broker_agency: "Bob's Brokers", broker_name: 'Bill'}
    end

    def employee
      [['male Sammy R. Davis Jr. 1925-12-08 ***-**-6789 2008-12-08',
        ['female Tracey M. Davis Jr. 1965-08-07 ***-**-9909',
         'male Manny D. Davis X 1971-09-09 ***-**-5505']],
       ['male Frank S. Sinatra III 1915-12-12 ***-**-2000 2007-12-12', []],
       ['male Dean D. Martin Sr. 1917-06-07 ***-**-4566 2012-03-03', []],
       ['female Abigail M. Yates PhD. 1975-12-08 ***-**-6001 2008-10-08',
        ['male Kevin R. Beckman X. 1985-08-07 ***-**-7603']],
       ['female Jillian S. Holtzmann PhD. 1985-11-11 ***-**-2050 2009-11-12', []],
       ['female Patty D. Tolan Cdtr 1987-06-06 ***-**-4546 2015-04-03', []],
       ['female Erin S. Gilbert PhD. 1969-03-01 ***-**-4554 2016-01-01', []]]
    end

    def health_plan_A group_difference
      {
          reference_plan_name: 'KP DC PLATINUM 500/20/DENTAL/PED DENTAL/SEL',
          reference_plan_HIOS_id: '94506DC0350009-01',
          carrier_name: 'Kaiser',
          plan_type: 'HMO',
          metal_level: 'Platinum',
          plan_option_kind: 'single_carrier',
          plans_by: 'All Plans From a Single Carrier',
          plans_by_summary_text: 'All Kaiser Plans',
          employer_contribution_by_relationship: {
              employee: 90 + group_difference,
              spouse: 80 + group_difference,
              domestic_partner: 70 + group_difference,
              child_under_26: 60 + group_difference
          },
          estimated_employer_max_monthly_cost: 6000 + (group_difference * 12),
          estimated_plan_participant_min_monthly_cost: 312 + (group_difference * 2),
          estimated_plan_participant_max_monthly_cost: 954 + (group_difference * 2)
      }
    end

    def health_plan_B group_difference
      {
          reference_plan_name: 'UHC CHOICE PLUS POS GOLD 0 B',
          reference_plan_HIOS_id: '78606AB0440009-05',
          carrier_name: 'United Health Care',
          plan_type: 'POS',
          metal_level: 'Gold',
          plan_option_kind: 'single_plan',
          plans_by: 'A Single Plan',
          plans_by_summary_text: 'Reference Plan Only',
          employer_contribution_by_relationship: {
              employee: 50 + group_difference,
              spouse: nil,
              domestic_partner: nil,
              child_under_26: 0
          },
          estimated_employer_max_monthly_cost: 6000 + (group_difference * 12),
          estimated_plan_participant_min_monthly_cost: 312 + (group_difference * 2),
          estimated_plan_participant_max_monthly_cost: 954 + (group_difference * 2)
      }
    end

    def client_A
      return 'Courageous Consulting, LLC', 30, 5, 0, [PlanYear.late_open_enrollment.previous, PlanYear.late_open_enrollment],
          [Helper::staffer(first: 'Bob', phone: '', email: 'bob@courageous-consulting.com')]
    end

    def client_B
      return 'National Network to End Domestic Abuse', 41, 10, 5, [PlanYear.in_open_enrollment],
          [Helper::staffer(first: 'Jane', phone: '202-555-0000', email: 'contact@endabuse.org'),
           Helper::office(address_1: '1600 New Hampshire Avenue')]
    end

    def client_C
      return 'District Yoga', 30, 20, 3, [PlanYear.in_renewal_open_enrollment.previous, PlanYear.in_renewal_open_enrollment],
          [Helper::staffer(first: 'Priya', last: 'Chandragupta', email: 'contact@districtyoga.com'),
           Helper::office(address_1: '1600 New York Avenue', phone: '202-555-0212')]
    end

    def client_D
      return 'DC Cupcakes', 50, 40, 7, [PlanYear.create_plan_starting_in(months: 5).previous, PlanYear.create_plan_starting_in(months: 5)],
          [Helper::staffer(first: 'Emile', last: 'Della Noce', email: 'contact@dccupcakes.com'),
           Helper::office(address_1: '1600 Rhode Island Avenue', phone: '202-555-0313')]
    end

    def client_E
      return 'OPEN Art Studio', 30, 20, 3, [PlanYear.late_open_enrollment], [
          Helper::staffer(first: 'Yona', last: 'Mendelssohn', email: 'yona@openart.org'),
          Helper::staffer(first: 'Noam', last: 'Mendelssohn', email: 'noam@openart.org'),
          Helper::office(address_1: '1600 Arizona Avenue', phone: '202-555-0414')]
    end

    def client_F
      return 'Best Brau Brewing Company', 30, 20, 6, [PlanYear.in_renewal.previous, PlanYear.in_renewal],
          [Helper::staffer(first: 'Heinrich', last: 'Biergarten', email: 'heini@bestbrau.com'),
           Helper::staffer(first: 'Ulrich', last: 'Suufersohn', email: 'ueli@bestbrau.com'),
           Helper::office(address_1: '1600 Nebraska Avenue', phone: '202-555-0515'),
           Helper::office(first: 'Branch', address_1: '6600 Nebraska Avenue')]
    end

    def client_G
      return 'Bistrot Du Monde', 33, 20, 4, [PlanYear.late_to_renewal.previous, PlanYear.late_to_renewal],
          [Helper::staffer(first: 'Claudette', last: 'Noire', email: 'cnoire@dumonde.com'),
           Helper::staffer(first: 'Aloise', last: 'Rouge', email: 'arouge@dumonde.com'),
           Helper::office(address_1: '1600 Louisiana Avenue', phone: '202-555-0005')]
    end

    def client_H
      return 'Bistrot Du Bois', 15, 7, 7, [PlanYear.early_renewal.previous, PlanYear.early_renewal],
          [Helper::staffer(first: 'Claudette', last: 'Blanc', email: 'cblan@dubois.com'),
           Helper::staffer(first: 'Aloise', last: 'Vert', email: 'avert@dubois.com'),
           Helper::office(address_1: '1600 Maine Avenue', phone: '202-555-0006')]
    end

    def client_I
      return 'Strategy & Tactics Game Shop', 6, 2, 2, [PlanYear.create_plan_starting_in(months: 8)],
          [Helper::staffer(first: 'Maria Susanna', last: 'Ludador', email: 'contact@stgames.com'),
           Helper::office(address_1: '1600 Georgia Avenue', phone: '202-555-0007')]
    end

    def client_J
      return "Portia's Tea Bar ", 12, 9, 2, [PlanYear.create_plan_starting_in(months: 7)],
          [Helper::staffer(first: 'Portia', last: 'Binglesworth-Inglesham', email: 'portia@helloportia.com'),
           Helper::office(address_1: '1600 Alabama Avenue', phone: '202-555-0008'),
           Helper::office(first: 'Branch', address_1: ' 1600 Utah Avenue', address_2: 'Suite 500', phone: '202-555-0009')]
    end

    def client_K
      return 'J.Grigory Food Trucks & Fine Comestibles', 66, 50, 0, [PlanYear.create_plan_starting_in(months: 6)],
          [Helper::staffer(first: 'Joe', last: 'Grigory', email: 'jgrigory @jgrigory.com'),
           Helper::office(address_1: '1600 North Carolina Avenue', phone: '202-555-0009')]
    end

  end
end