# HBX-mobile-app-APIs
Specifications and resources for mobile apps needed by the HBX mobile app

## "My Account" API (Enroll App)
Workflow:
1. The mobile app connects to IAM, passing user credentials, to retrieve a valid SAML token
2. The mobile app connects to the EnrollApp session API to establish a session, passing the SAML token
3. Inside that same session, the mobile app hits a "My Account" API URL (to be determined by the EnrollApp team) such as: 
    GET https://enroll.dchealthlink.org/api/my-account/
4. The following JSON payload is returned:
* [schema](https://github.com/benjaminrosenbaum/HBX-mobile-app-APIs/blob/master/enroll/my-account/response/schema.json)
* [example](https://github.com/benjaminrosenbaum/HBX-mobile-app-APIs/blob/master/enroll/my-account/response/example.json)
