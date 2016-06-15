#! /usr/bin/env ruby

require 'date'

class Date
    def on(mday)
        Date.new(year, mon, mday)
    end
end

class PlanYear
    def initialize(start_date, in_open_enrollment)
        @start_date = start_date
        @in_open_enrollment = in_open_enrollment
    end

    def end_of_open_enrollment
        (@start_date << 1).on(13)
    end

    def renewal_deadline
        end_of_open_enrollment - 3
    end

    def earliest_open_enrollment_begins
        @start_date << 2
    end

    def open_enrollment_begins
        earliest_open_enrollment_begins if @in_open_enrollment 
    end

    def renewal_begins
        @start_date << 3
    end

    def plan_year_begins
        @start_date
    end

    def date_fields
        """\"open_enrollment_begins\" : #{fmt(open_enrollment_begins)},
            \"open_enrollment_ends\" : #{fmt(end_of_open_enrollment)},
            \"plan_year_begins\": #{fmt(plan_year_begins)},
            \"renewal_application_available\": #{fmt(renewal_begins)},
            \"renewal_application_due\": #{fmt(renewal_deadline)}"""
    end
end

def plan_starting_in(months, in_open_enrollment)
    now = Date.parse(Time.now.to_s)
    PlanYear.new( (now >> months).on(1), in_open_enrollment)
end


def fmt(dt)
    if dt
        "\"%s\"" % dt.strftime("%m-%d-%Y")
    else
        "null"
    end
end



in_open_enrollment = plan_starting_in(2, true)
in_renewal = plan_starting_in(2, false)
later = plan_starting_in(5, false)
even_later = plan_starting_in(9, false)



text = """
 {
    \"broker_agency\" : \"Bob's Brokers\",
    
    \"broker_clients\": [
            {
            \"employer_name\": \"Courageous Consulting, LLC\",
            #{in_open_enrollment.date_fields},
            \"renewal_in_progress\": \"false\",
            \"binder_payment_due\": null,
            \"employees_total\": 30,
            \"employees_enrolled\": 5,
            \"employees_waived\": 0,
            \"minimum_participation_required\": 20,
            \"estimated_premium\": {
                \"employee_contribution\": 3237.00,
                \"employer_contribution\": 9321.00
                },
            \"contact_info\": {
                \"phone\": \"202-468-6571\",
                \"email\": \"contact@courageous-consulting.com\",
                \"address_1\": \"1600 Pennsylvania Avenue\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20500\"
                },
            \"active_general_agency\": null
            },
            {
            \"employer_name\": \"National Network to End Domestic Abuse\",
            #{in_open_enrollment.date_fields},
            \"renewal_in_progress\": \"false\",
            \"binder_payment_due\": null,
            \"employees_total\": 41,
            \"employees_enrolled\": 10,
            \"employees_waived\": 5,
            \"minimum_participation_required\": 27,
            \"estimated_premium\": {
                \"employee_contribution\": 5447.00,
                \"employer_contribution\": 6644.00
                },
            \"contact_info\": {
                \"phone\": \"202-444-9000\",
                \"email\": \"contact@endabuse.org\",
                \"address_1\": \"1600 New Hampshire Avenue\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20500\"
                },
            \"active_general_agency\": null
            },
            {
            \"employer_name\": \"District Yoga\",
            #{in_open_enrollment.date_fields},
            \"renewal_in_progress\": \"false\",
            \"binder_payment_due\": null,
            \"employees_total\": 30,
            \"employees_enrolled\": 20,
            \"employees_waived\": 3,
            \"minimum_participation_required\": 20,
            \"estimated_premium\": {
                \"employee_contribution\": 3447.00,
                \"employer_contribution\": 3001.00
                },
            \"contact_info\": {
                \"phone\": \"202-444-9000\",
                \"email\": \"contact@districtyoga.com\",
                \"address_1\": \"1600 New York Avenue\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20500\"
                },
            \"active_general_agency\": null
            },
            {
            \"employer_name\": \"DC Cupcakes\",
            #{later.date_fields},
            \"renewal_in_progress\": \"false\",
            \"binder_payment_due\": null,
            \"employees_total\": 50,
            \"employees_enrolled\": 40,
            \"employees_waived\": 7,
            \"minimum_participation_required\": 35,
            \"estimated_premium\": {
                \"employee_contribution\": 93447.00,
                \"employer_contribution\": 8001.00
                },
            \"contact_info\": {
                \"phone\": \"202-444-9000\",
                \"email\": \"contact@dccupcakes.com\",
                \"address_1\": \"1600 Rhode Island Avenue\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20500\"
                },
            \"active_general_agency\": null
            },
            {
            \"employer_name\": \"OPEN Art Studio\",
            #{in_open_enrollment.date_fields},
            \"renewal_in_progress\": \"false\",
            \"binder_payment_due\": null,
            \"employees_total\": 30,
            \"employees_enrolled\": 20,
            \"employees_waived\": 3,
            \"minimum_participation_required\": 20,
            \"estimated_premium\": {
                \"employee_contribution\": 5447.00,
                \"employer_contribution\": 6644.00
                },
            \"contact_info\": {
                \"phone\": \"202-444-9000\",
                \"email\": \"contact@openart.org\",
                \"address_1\": \"1600 New Hampshire Avenue\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20500\"
                },
            \"active_general_agency\": \"Betadyne General Agency, Inc.\"
            },
            {
            \"employer_name\": \"Best Brau Brewing Company\",
            #{in_renewal.date_fields},
            \"renewal_in_progress\": \"true\",
            \"binder_payment_due\": null,
            \"employees_total\": 30,
            \"employees_enrolled\": 20,
            \"employees_waived\": 3,
            \"minimum_participation_required\": 20,
            \"estimated_premium\": {
                \"employee_contribution\": 5447.00,
                \"employer_contribution\": 6644.00
                },
            \"contact_info\": {
                \"phone\": \"202-444-9000\",
                \"email\": \"contact@bistroducoin.com\",
                \"address_1\": \"1600 New Hampshire Avenue\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20500\"
                },
            \"active_general_agency\": \"ACME General Agency, Inc.\"
            },
            {
            \"employer_name\": \"Bistrot Du Monde\",
            #{in_renewal.date_fields},
            \"renewal_in_progress\": \"true\",
            \"binder_payment_due\": null,
            \"employees_total\": 30,
            \"employees_enrolled\": 20,
            \"employees_waived\": 3,
            \"minimum_participation_required\": 20,
            \"estimated_premium\": {
                \"employee_contribution\": 5447.00,
                \"employer_contribution\": 6644.00
                },
            \"contact_info\": {
                \"phone\": \"202-444-9000\",
                \"email\": \"contact@bistrodumonde.com\",
                \"address_1\": \"1600 New Hampshire Avenue\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20500\"
                },
            \"active_general_agency\": \"ACME General Agency, Inc.\"
            },
            {
            \"employer_name\": \"Strategy & Tactics Game Shop\",
            #{later.date_fields},
            \"renewal_in_progress\": \"false\",
            \"binder_payment_due\": null,
            \"employees_total\": 6,
            \"employees_enrolled\": 2,
            \"employees_waived\": 2,
            \"minimum_participation_required\": 4,
            \"estimated_premium\": {
                \"employee_contribution\": 22447.00,
                \"employer_contribution\": 33041.00
                },
            \"contact_info\": {
                \"phone\": \"202-444-9000\",
                \"email\": \"contact@stgames.com\",
                \"address_1\": \"1500 Arizona Avenue\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20170\"
                },
            \"active_general_agency\": null
            },
            {
            \"employer_name\": \"Portia's Tea Bar\",
            #{even_later.date_fields},
            \"renewal_in_progress\": \"false\",
            \"binder_payment_due\": null,
            \"employees_total\": 12,
            \"employees_enrolled\": 9,
            \"employees_waived\": 2,
            \"minimum_participation_required\": 8,
            \"estimated_premium\": {
                \"employee_contribution\": 52447.00,
                \"employer_contribution\": 63041.00
                },
            \"contact_info\": {
                \"phone\": \"202-468-6571\",
                \"email\": \"portia@portiasteabar.com\",
                \"address_1\": \"100 M St NW\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20110\"
                },
            \"active_general_agency\": null
            },
            {
            \"employer_name\": \"J. Grigory Food Trucks & Fine Comestibles\",
            #{even_later.date_fields},
            \"renewal_in_progress\": \"false\",
            \"binder_payment_due\": null,
            \"employees_total\": 66,
            \"employees_enrolled\": 50,
            \"employees_waived\": 0,
            \"minimum_participation_required\": 44,
            \"estimated_premium\": {
                \"employee_contribution\": 152447.00,
                \"employer_contribution\": 163041.00
                },
            \"contact_info\": {
                \"phone\": \"202-468-6571\",
                \"email\": \"info@jgrigoryfoods.com\",
                \"address_1\": \"100 M St NE\",
                \"address_2\": null,
                \"city\": \"Washington\",
                \"state\": \"DC\",
                \"zip\": \"20110\"
                },
            \"active_general_agency\": null
            }
    ]
}
"""

print text



