# Test plan for RIDP Live Access

## Setup

Turn on RIDP testing at the ESB

## Test Case 1: [unknown_user](https://github.com/dchealthlink/HBX-mobile-app-APIs/tree/master/static/ridp/live_test/unknown_user)
- send the [XML payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/unknown_user/soap.request.xml) to the ESB via rails console
  - make sure it appears on the ESB
  - capture [the response XML](https://github.com/dchealthlink/HBX-mobile-app-APIs/blob/master/static/ridp/live_test/unknown_user/soap.response.xml)
- send the [JSON payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/unknown_user/converted.request.json) to the ESB via rails console, using the enroll_mobile_api code to convert it to JSON 
  - make sure it appears on the ESB
  - make sure [the response XML](https://github.com/dchealthlink/HBX-mobile-app-APIs/blob/master/static/ridp/live_test/unknown_user/soap.response.xml) is the same

## Test Case 2: [valid_answers](https://github.com/dchealthlink/HBX-mobile-app-APIs/tree/master/static/ridp/live_test/valid_answers)
- send the first [XML payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/valid_answers/soap.request.xml) with PII to the ESB via rails console
  - make sure it appears on the ESB
  - capture [the response XML](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/valid_answers/soap.response.xml)
- send the second [XML payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/valid_answers/soap.answers.request.xml) with answers to the ESB via rails console
  - make sure it appears on the ESB
  - capture [the response XML](TODO link: valid_answers/soap_response_answers.xml)
  - send the [JSON payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/valid_answers/converted.request.json) to the ESB via rails console, using the enroll_mobile_api code to convert it to JSON
  - make sure it appears on the ESB
  - make sure [the response XML](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/valid_answers/soap.response.xml) is the same
  [TODO : the same for JSON ]
  
## Test Case 3: [wrong_answers](https://github.com/dchealthlink/HBX-mobile-app-APIs/tree/master/static/ridp/live_test/wrong_answers)
- send the first [XML payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/wrong_answers/soap.request.xml) with PII to the ESB via rails console
  - make sure it appears on the ESB
  - capture [the response XML]()
- send the second [XML payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/wrong_answers/soap.answers.request.xml) with answers to the ESB via rails console
  - make sure it appears on the ESB
  - capture [the response XML](TODO link: wrong_answers/soap.response.answers.xml)
- capture the transaction id from the second response
- send the third [XML payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/wrong_answers/soap.override.request.xml) with the transactionid to the ESB via rails console
(TODO...)




