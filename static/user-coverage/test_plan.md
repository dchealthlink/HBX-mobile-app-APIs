# Test plan for /user-coverage

## Setup

- from [/endpoints](https://hbx-mobile2-preprod.dchbx.org/endpoints), POST to /verify_identity with a [request JSON containing a unique set of PII](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/new_signup/post_verify_identity.json) for each specific test case
  - capture the [response JSON](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/new_signup/verify_identity_questions.json) containing questions to verify identity
- send a [request JSON](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/new_signup/post_answer_questions.json) containing the verify identity answers to POST /verify_identity/answers
  - capture the token in the [response JSON](https://github.com/dchealthlink/HBX-mobile-app-APIs/raw/master/static/ridp/new_signup/verify_identity.json)
- send [request JSON](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/sign-up/request_payload.json) containing that set of PII and a generated username and password to POST /sign-up
  - note that same [username and password](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/login/local_login_request.json) will be used to hit /login

## Test Case 1 [enroll_person_not_found](https://github.com/dchealthlink/HBX-mobile-app-APIs/tree/master/static/user-coverage/enroll_person_not_found)
- POST /login with [username and password](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/login/local_login_request.json)
- GET /user-coverage
  - capture the [response JSON](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/user-coverage/enroll_person_not_found/user-coverage.response.json) 

## Test Case 2 [has_coverage](https://github.com/dchealthlink/HBX-mobile-app-APIs/tree/master/static/user-coverage/has_coverage)
- Create account for same set of PII on [enroll preprod 2](https://enroll-mobile2.dchbx.org/) (must be done after /sign-up on mobile integration server)
- POST /login with [username and password](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/login/local_login_request.json)
  - GET /user-coverage
  - capture the [response JSON](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/user-coverage/has_no_coverage/user-coverage.response.json)
- create insurance plan for user on [enroll preprod 2](https://enroll-mobile2.dchbx.org/)
- GET /user-coverage
  - capture the [response JSON](https://github.com/dchealthlink/HBX-mobile-app-APIs/raw/master/static/user-coverage/has_coverage/user-coverage.response.json)

## Test Case 3 [has_no_coverage](https://github.com/dchealthlink/HBX-mobile-app-APIs/tree/master/static/user-coverage/has_no_coverage)
- Create account for same set of PII on [enroll preprod 2](https://enroll-mobile2.dchbx.org/) (must be done after /sign-up on mobile integration server)
- POST /login with [username and password](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/login/local_login_request.json)
  - GET /user-coverage
  - capture the [response JSON](https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/user-coverage/has_no_coverage/user-coverage.response.json)


## handling for Attestation::medicaiddhsreviewauth

## handling for RIDP connection error

## error handling for "user unknown" on RIDP question fetch

## 