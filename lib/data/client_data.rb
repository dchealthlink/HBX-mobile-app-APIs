class ClientData

  class << self

    def client_A
      return 'Courageous Consulting, LLC', '5834a475e41b070fd20001d5', 30, 5, 0, [PlanYear.late_open_enrollment.previous, PlanYear.late_open_enrollment],
          [Helper::staffer(first: 'Bob', phone: '', email: 'bob@courageous-consulting.com')]
    end

    def client_B
      return 'National Network to End Domestic Abuse', '6834a475e41b070fd20001d5', 41, 10, 5, [PlanYear.in_open_enrollment],
          [Helper::staffer(first: 'Jane', phone: '202-555-0000', email: 'contact@endabuse.org'),
           Helper::office(address_1: '1600 New Hampshire Avenue')]
    end

    def client_C
      return 'District Yoga', '7834a475e41b070fd20001d5', 30, 20, 3, [PlanYear.in_renewal_open_enrollment.previous, PlanYear.in_renewal_open_enrollment],
          [Helper::staffer(first: 'Priya', last: 'Chandragupta', email: 'contact@districtyoga.com'),
           Helper::office(address_1: '1600 New York Avenue', phone: '202-555-0212')]
    end

    def client_D
      return 'DC Cupcakes', '8834a475e41b070fd20001d5', 50, 40, 7, [PlanYear.create_plan_starting_in(months: 5).previous, PlanYear.create_plan_starting_in(months: 5)],
          [Helper::staffer(first: 'Emile', last: 'Della Noce', email: 'contact@dccupcakes.com'),
           Helper::office(address_1: '1600 Rhode Island Avenue', phone: '202-555-0313')]
    end

    def client_E
      return 'OPEN Art Studio', '9834a475e41b070fd20001d5', 30, 20, 3, [PlanYear.late_open_enrollment], [
          Helper::staffer(first: 'Yona', last: 'Mendelssohn', email: 'yona@openart.org'),
          Helper::staffer(first: 'Noam', last: 'Mendelssohn', email: 'noam@openart.org'),
          Helper::office(address_1: '1600 Arizona Avenue', phone: '202-555-0414')]
    end

    def client_F
      return 'Best Brau Brewing Company', '5834a475e41b070fd20001d6', 30, 20, 6, [PlanYear.in_renewal.previous, PlanYear.in_renewal],
          [Helper::staffer(first: 'Heinrich', last: 'Biergarten', email: 'heini@bestbrau.com'),
           Helper::staffer(first: 'Ulrich', last: 'Suufersohn', email: 'ueli@bestbrau.com'),
           Helper::office(address_1: '1600 Nebraska Avenue', phone: '202-555-0515'),
           Helper::office(first: 'Branch', address_1: '6600 Nebraska Avenue')]
    end

    def client_G
      return 'Bistrot Du Monde', '5834a475e41b070fd20001d7', 33, 20, 4, [PlanYear.late_to_renewal.previous, PlanYear.late_to_renewal],
          [Helper::staffer(first: 'Claudette', last: 'Noire', email: 'cnoire@dumonde.com'),
           Helper::staffer(first: 'Aloise', last: 'Rouge', email: 'arouge@dumonde.com'),
           Helper::office(address_1: '1600 Louisiana Avenue', phone: '202-555-0005')]
    end

    def client_H
      return 'Bistrot Du Bois', '5834a475e41b070fd20001d8', 15, 7, 7, [PlanYear.early_renewal.previous, PlanYear.early_renewal],
          [Helper::staffer(first: 'Claudette', last: 'Blanc', email: 'cblan@dubois.com'),
           Helper::staffer(first: 'Aloise', last: 'Vert', email: 'avert@dubois.com'),
           Helper::office(address_1: '1600 Maine Avenue', phone: '202-555-0006')]
    end

    def client_I
      return 'Strategy & Tactics Game Shop', '5834a475e41b070fd20001d9', 6, 2, 2, [PlanYear.create_plan_starting_in(months: 8)],
          [Helper::staffer(first: 'Maria Susanna', last: 'Ludador', email: 'contact@stgames.com'),
           Helper::office(address_1: '1600 Georgia Avenue', phone: '202-555-0007')]
    end

    def client_J
      return "Portia's Tea Bar ", '1034a475e41b070fd20001d5', 12, 9, 2, [PlanYear.create_plan_starting_in(months: 7)],
          [Helper::staffer(first: 'Portia', last: 'Binglesworth-Inglesham', email: 'portia@helloportia.com'),
           Helper::office(address_1: '1600 Alabama Avenue', phone: '202-555-0008'),
           Helper::office(first: 'Branch', address_1: ' 1600 Utah Avenue', address_2: 'Suite 500', phone: '202-555-0009')]
    end

    def client_K
      return 'J.Grigory Food Trucks & Fine Comestibles', '1134a475e41b070fd20001d5', 66, 50, 0, [PlanYear.create_plan_starting_in(months: 6)],
          [Helper::staffer(first: 'Joe', last: 'Grigory', email: 'jgrigory @jgrigory.com'),
           Helper::office(address_1: '1600 North Carolina Avenue', phone: '202-555-0009')]
    end

  end
end