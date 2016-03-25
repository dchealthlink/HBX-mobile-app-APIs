# HBX-mobile-app-APIs
Specifications and resources for mobile apps needed by the HBX mobile app

## APIs needed - Iteration 0

Iteration 0 of the mobile app targets SHOP employees who have already enrolled and received coverage, and allows them to check their coverage details.

### EnrollApp Login API
* _developed by: EnrollApp team (does this exist already?)_
* accepts SAML token, establishes session, returns session key

### Mobile Login API
* _developed by: Mobile Team_
* called by Mobile app
* POST body: {email, password}
* calls IAM API to authenticate, retrieve SAML token
* passes SAML token to EnrollApp Login API, retrieves session key
* stores phone id / session key / email in persistent table
* returns session key to phone

### "My Account" API 
 * _developed by: EnrollApp team (intially movked by Mobile team)_
 * _called by: mobile app, with session key (in header?)_ 
 * Returns information about the account, including accountholder info, broker, and plans
 
 * Simple case: Individual/Family or Employee User (MVP):
   URL to be determined by the EnrollApp team, e.g.: 
     `GET https://enroll.dchealthlink.org/api/my-account/`
     The following JSON payload is returned:
     * [schema](enroll/my-account/response/schema.json)
     * [example](enroll/my-account/response/example.json)
     (TODO: add accountholder info)

  * Variation - Employer or Broker (post-MVP):
     Possibly, the enroller or broker may be able to get a list of accounts they manage (employees, clients), and then
     call the above API with a user id, and receive the same payload if authorized to see it
     e.g. `GET https://enroll.dchealthlink.org/api/my-account/12345`

## APIs needed - Iteration 1

Iteration 2 of the mobile app targets SHOP employees and provides them with notifications and the opportunity to upload documents


### Document Store API
* _developed by_: Mobile team or EnrollApp team?
* securely/asynchronously upload a document, get back a URL where it can be found
TODO 

### "Dispatch Notification" API
 * _developed by: Mobile Team_
 * _called by: EnrollApp_
 * passed notification text + optionally, metadata for a desired upload, callback info
 * records notifications to be fetched by phone, including info for callback on upload
 * dispatches push notifications to phone via Google & Apple servers

### "Fetch Notifications" API
 * _developed by: Mobile Team_
 * _called by: mobile client_
 * passed information on which notifications have been seen already
 * retrieves cached & unseen notifications, including upload requests
TODO

### "Register Notification Response" API
 * _developed by: Mobile Team_
 * _called by: mobile client_
 * passed URL of uploaded document, metadata
 * calls registered callback, e.g. EnrollApp "Upload Receipt Callback" API
 
### "Upload Receipt Callback"
 * _developed by: EnrollApp team (mocked initially by mobile team?)_
 * _called by: Register Notification Response API_
 * notifies EnrollApp of upload with metadata
TODO

## APIs needed - Iteration 2

Iteration 1 of the mobile app targets SHOP employees and provides end-to-end registration, shopping, and account details.

### "new account creation" Web Service 
* _developed by: Security team (part of "Fish 3" effort)_
* called by: mobile app or Mobile Login API
* details TBD

### Account Screening/Disambiguation API
* _developed by:_ EnrollApp team 
* accepts account information, reconciles with duplicates, finishes valid account creation
* Notes: 
    name parts, dob, ssn -> matching returns list of companies, choose company -> match with existing personid, employer
    -- if existing user acct, send to account recovery
    need home address -- validate personal/contact info
    family members & relationships (eligibility for coverage, differntial employer contributions by relationship)
* details TBD

### "Available Plans" API 
 * *exposed by: EnrollApp*
 * *called by: mobile app*
--> consider reason for enrollment, age/family structure affecting premiums

## APIs needed - Iteration 3

Iteration 3 of the mobile app targets SHOP employees and provides them with the ability to register Life Events and submit appropriate documentation

TODO 

## APIs needed - Iteration 4

Iteration 4 of the mobile app targets SHOP _employers_ and allows them to view their roster of employees and those employees' statuses and coverage info, as well as administer their plan offerings. N.B.: Priorities & feature inclusions for Iteration 4 are still being determined.

TODO

******

### Some resources for dealing with JSON schemas:
* [jsonschema - Python tool] (http://python-jsonschema.readthedocs.org/en/latest/)
* [JSON Schema Lint - validator of JSON against a schema] (http://jsonschemalint.com/draft4/#)
* [JSON Schema Generator] (http://jsonschema.net/#/)
