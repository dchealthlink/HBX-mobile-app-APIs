# Test plan for RIDP Live Access

## Setup

Turn on RIDP testing at the ESB

## Test Case 1: [unknown_user](https://github.com/dchealthlink/HBX-mobile-app-APIs/tree/master/static/ridp/live_test/unknown_user)
- send the [XML payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/unknown_user/soap.request.xml) to the ESB via rails console
  - make sure it appears on the ESB
  - capture [the response XML](https://github.com/dchealthlink/HBX-mobile-app-APIs/blob/master/static/ridp/live_test/unknown_user/soap_response.xml)
- send the [JSON payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/unknown_user/converted_request.json) to the ESB via rails console, using the enroll_mobile_api code to convert it to JSON 
  - make sure it appears on the ESB
  - make sure [the response XML](https://github.com/dchealthlink/HBX-mobile-app-APIs/blob/master/static/ridp/live_test/unknown_user/soap_response.xml) is the same
