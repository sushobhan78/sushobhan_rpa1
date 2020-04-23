namespace: register_user_act
flow:
  name: Register_user_in_AOS_flow
  workflow:
  - Register_user_in_AOS:
      do:
        register_user_act.Register_user_in_AOS: []
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
