# HBX-mobile-app-APIs
Specifications and resources for mobile apps needed by the HBX mobile app

The MVP uses existing IAM & EnrollApp security systems, and not require any changes to HBX's security systems.

## Broker APIs

Entry point: 
   * [hostname]/api/v1/mobile/broker
      * [example response](generated/broker_1/broker_details.json)

via HATEOAS:
   * [hostname]/api/v1/mobile/employer/&lt;id&gt;
      * [example response](generated/broker_1/employer_details_0.json)
   *  [hostname]/api/v1/mobile/employer/&lt;id&gt;/employees
      * [example response](generated/broker_1/roster_0.json)

## Employer APIs

Entry points: 
   * [hostname]/api/v1/mobile/employer/
      * [example response](generated/er_in_open_enrollment/employer_details.json)
   * [hostname]/api/v1/mobile/employer/employees
      * [example response](generated/er_in_open_enrollment/roster.json)

## Individual APIs

Entry points: 
   * [hostname]/api/v1/mobile/individual
      * [example response](generated/individual_aptc/insured.json)
   * [hostname]/api/v1/mobile/plans
      * Parameters:
       	* coverage_kind - health or dental
        * active_year - if not given, upcoming year
        * csr_kind - value for whether to restrict search by CSR eligibility
        * ages - array of ages of family members, for premium calculation
       	* elected_aptc_amount - for premium calculation
        * effective_on - date to investigate plans for
   	* [example response](generated/plans_for_uqhp_family/plans.json)

via HATEOAS:
   * [hostname]/api/v1/mobile/plans/&lt;id&gt;/services
      * [example response](generated/services/service_rates.json)

## Sign Up

Entry points: 
   * [hostname]/sign-up
      * Parameters:
       	* username - User Name
        * password - Password
        * token - encrypted token returned by the call to the Enroll RIDP endpoint
        * ssn - Social Security Number
