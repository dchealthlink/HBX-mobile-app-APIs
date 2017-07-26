# HBX-mobile-app-APIs
Specifications and resources for mobile apps needed by the HBX mobile app

The MVP uses existing IAM & EnrollApp security systems, and not require any changes to HBX's security systems.

## APIs in _[enroll-mobile-api](https://github.com/dchealthlink/enroll-mobile-api)_

### Broker APIs

#####    _Broker_
Entry point: 
   * [hostname]/api/v1/mobile/broker
      * [example response](generated/broker_1/broker_details.json)

#### via HATEOAS:
#####    _Employer Details for Broker_
   * [hostname]/api/v1/mobile/employer/&lt;id&gt;
      * [example response](generated/broker_1/employer_details_0.json)
#####    _Employee Roster for Broker_
   *  [hostname]/api/v1/mobile/employer/&lt;id&gt;/employees
      * [example response](generated/broker_1/roster_0.json)

### Employer APIs

Entry points: 
#####    _Employer_
   * [hostname]/api/v1/mobile/employer/
      * [example response](generated/er_in_open_enrollment/employer_details.json)
#####    _Employee Roster for Employer_
   * [hostname]/api/v1/mobile/employer/employees
      * [example response](generated/er_in_open_enrollment/roster.json)

### Individual APIs

Entry points: 
#####    _Individual_
   * [hostname]/api/v1/mobile/individual
      * [example response](generated/individual_aptc/insured.json)
#####    _Plans_
  * [hostname]/api/v1/mobile/plans
      * Parameters:
       	* coverage_kind - health or dental
        * active_year - YYYY; if not given, upcoming year
        * csr_kind - value for whether to restrict search by CSR eligibility
        * ages - array of ages of family members, for premium calculation
       	* elected_aptc_amount - for premium calculation
        * effective_on - date to investigate plans for
   	* [example response](generated/plans_for_uqhp_family/plans.json)

#### via HATEOAS:
#####   _Services & Rates_ 
   * [hostname]/api/v1/mobile/services_rates
      * Parameters:
        * coverage_kind - health or dental
        * active_year - YYYY, year of plan
        * hios_id - id of insurance plan
      * [example response](generated/services/service_rates.json)

## APIs in _[hbx-mobile-integration](https://github.com/dchealthlink/hbx-mobile-integration)_

## Sign Up

Entry points: 
   * [hostname]/sign-up
      * Parameters (POST only):
       	* username - User Name
        * password - Password
        * token - encrypted token returned by the call to the Enroll RIDP endpoint
        * ssn - Social Security Number
        * first_name - First Name
        * last_name - Last Name
        * date_of_birth - Date of Birth (MM/DD/YYYY)
