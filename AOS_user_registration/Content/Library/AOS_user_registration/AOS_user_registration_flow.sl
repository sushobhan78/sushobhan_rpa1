namespace: AOS_user_registration
flow:
  name: AOS_user_registration_flow
  workflow:
  - AOS_user_registration:
      do:
        AOS_user_registration.AOS_user_registration: []
      publish:
      - return_result
      - error_message
      navigate:
      - SUCCESS: SUCCESS
      - WARNING: SUCCESS
      - FAILURE: on_failure
  outputs:
  - return_result
  - error_message
  results:
  - SUCCESS
  - FAILURE
