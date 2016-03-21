# HBX-mobile-app-APIs
Specifications and resources for mobile apps needed by the HBX mobile app

## "My Account" API (Enroll App)

### Workflow - Individual/Family or Employee User (MVP):

1. The mobile app connects to IAM, passing user credentials, to retrieve a valid SAML token
2. The mobile app connects to the EnrollApp session API to establish a session, passing the SAML token
3. Inside that same session, the mobile app hits a "My Account" API URL (to be determined by the EnrollApp team) such as: 
    `GET https://enroll.dchealthlink.org/api/my-account/`
4. The following JSON payload is returned:
  * [schema](enroll/my-account/response/schema.json)
  * [example](enroll/my-account/response/example.json)
  
### Variation - Employer or Broker (post-MVP):

Possibly, the enroller or broker may be able to get a list of accounts they manage (employees, clients), and then call the above API with a user id, and receive the same payload if authorized to see it
e.g. `GET https://enroll.dchealthlink.org/api/my-account/12345`

## Document Store API
TODO 

## Notifications APIs

### "Dispatch Notification"
 *exposed by: Notifications Server*

*called by: EnrollApp*
TODO

### (Google & Apple Push Notification APIs)
 *called by: Notifications Server*

### "Fetch Notifications" 
 *exposed by: Notifications Server* 
 *called by: mobile client*
TODO

### "Register Notification Response"  
 *exposed by: Notifications Server*
 *called by: mobile client*
TODO


******

### Some resources for dealing with JSON schemas:
* [jsonschema - Python tool] (http://python-jsonschema.readthedocs.org/en/latest/)
* [JSON Schema Lint - validator of JSON against a schema] (http://jsonschemalint.com/draft4/#)
* [JSON Schema Generator] (http://jsonschema.net/#/)
