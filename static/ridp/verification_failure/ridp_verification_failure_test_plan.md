# RIDP Verification Failure Test Plan

## Setup
- Turn on RIDP testing at the ESB for Test Cases 1 & 2

## Test Case 1: [Unknown User](https://github.com/dchealthlink/HBX-mobile-app-APIs/blob/master/static/ridp/verification_failure/401_unknown_user/server_response.json)

- GET /endpoints
- POST [JSON payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/unknown_user/converted.request.json) to /verify_identity with fabricated PII
	- make sure POST appears on the ESB
	- capture [the response XML](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/unknown_user/soap.response.xml)
- Make sure server's response is a [401 error message](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/verification_failure/401_unknown_user/server_response.json) that user was not found.

## Test Case 2: [Incorrect Responses/Check Override](https://github.com/dchealthlink/HBX-mobile-app-APIs/blob/master/static/ridp/verification_failure/412_incorrect_responses_recoverable/server_response.json)
- GET /endpoints
- POST [JSON payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/new_signup/post_verify_identity.json) to /verify_identity with valid (test) PII
	- Make sure [response JSON](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/verification_failure/verify_identity_questions.json) contains questions to verify identity
- POST [JSON payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/live_test/wrong_answers/converted.answers.request.json) containing wrong answers to /verify_identity/answers
- Make sure server's response is a [412 error message](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/verification_failure/412_incorrect_responses_recoverable/server_response.json) that user did not pass identity validation, and contains a transaction ID.

## Setup
- Turn *off* RIDP testing at the ESB for Test Cases

## Test Case: [Status Codes for RIDP connection error](https://github.com/dchealthlink/HBX-mobile-app-APIs/tree/master/static/ridp/new_signup)

- GET /endpoints
- POST [JSON payload](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/new_signup/post_verify_identity.json) to /verify_identity with valid (test) PII
- Make sure server's response is an [error message](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/verification_failure/503_experian_unreachable/server_response.json) that Experian could not be reached