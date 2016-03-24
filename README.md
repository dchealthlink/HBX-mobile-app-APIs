# HBX-mobile-app-APIs
Specifications and resources for mobile apps needed by the HBX mobile app

## APIs needed - Iteration 0

Iteration 0 of the mobile app targets SHOP employees who have already enrolled and received coverage, and allows them to check their coverage details.

## APIs needed - Iteration 1

Iteration 1 of the mobile app targets SHOP employees and provides end-to-end registration, shopping, and account details.

## APIs needed - Iteration 2

Iteration 2 of the mobile app targets SHOP employees and provides them with notifications and the opportunity to upload documents

## APIs needed - Iteration 3

Iteration 3 of the mobile app targets SHOP employees and provides them with the ability to register Life Events and submit appropriate documentation

## APIs needed - Iteration 4

Iteration 4 of the mobile app targets SHOP _employers_ and allows them to view their roster of employees and those employees' statuses and coverage info, as well as administer their plan offerings. N.B.: Priorities & feature inclusions for Iteration 4 are still being determined.




## Context 
### _How does the Mobile App call the EnrollApp APIs?_
1. The mobile app connects to IAM, passing user credentials, to retrieve a valid SAML token
2. The mobile app connects to the EnrollApp session API to establish a session, passing the SAML token
3. The mobile app calls an API from within that session

# List of APIs

## Security APIs (IAM)



### Web Service to create a new user account
* *exposed by: IAM*
* *called by: mobile app*
* TBD
 
### Web Service to log in to an existing user account 
* *exposed by: IAM*
* *called by: mobile app*
* Returns a SAML token to pass to EnrollApp's _create session_ API

## Core EnrollApp APIs

### Registration and Login APIs
name parts, dob, ssn -> matching returns list of companies, choose company -> match with existing personid, employer
-- if existing user acct, send to account recovery
need home address -- validate personal/contact info
family members & relationships (eligibility for coverage, differntial employer contributions by relationship)


### "My Account" API 
 * *exposed by: EnrollApp*
 * *called by: mobile app*
 * Returns information about the account, including accountholder info, broker, and plans (

* Simple case: Individual/Family or Employee User (MVP):
URL to be determined by the EnrollApp team, e.g.: 
    `GET https://enroll.dchealthlink.org/api/my-account/`
4. The following JSON payload is returned:
  * [schema](enroll/my-account/response/schema.json)
  * [example](enroll/my-account/response/example.json)
  
#### Variation - Employer or Broker (post-MVP):

Possibly, the enroller or broker may be able to get a list of accounts they manage (employees, clients), and then call the above API with a user id, and receive the same payload if authorized to see it
e.g. `GET https://enroll.dchealthlink.org/api/my-account/12345`

### "Available Plans" API 
 * *exposed by: EnrollApp*
 * *called by: mobile app*
 
--> consider reason for enrollment, life events etc


## Document Store API
TODO 

## Notifications APIs

### "Dispatch Notification"
 * *exposed by: Notifications Server*
 * *called by: EnrollApp*

TODO

### (Google & Apple Push Notification APIs)
* *called by: Notifications Server*

### "Fetch Notifications" 
* *exposed by: Notifications Server* 
* *called by: mobile client*

TODO

### "Register Notification Response"  
* *exposed by: Notifications Server*
* *called by: mobile client*

TODO

******

### Some resources for dealing with JSON schemas:
* [jsonschema - Python tool] (http://python-jsonschema.readthedocs.org/en/latest/)
* [JSON Schema Lint - validator of JSON against a schema] (http://jsonschemalint.com/draft4/#)
* [JSON Schema Generator] (http://jsonschema.net/#/)
