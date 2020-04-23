namespace: Create_User
flow:
  name: Create_User_flow
  workflow:
  - Create_User:
      do:
        Create_User.Create_User: []
      publish:
      - user_status
      - return_result
      - error_message
      navigate:
      - SUCCESS: SUCCESS
      - WARNING: SUCCESS
      - FAILURE: on_failure
  outputs:
  - user_status
  - return_result
  - error_message
  results:
  - SUCCESS
  - FAILURE
