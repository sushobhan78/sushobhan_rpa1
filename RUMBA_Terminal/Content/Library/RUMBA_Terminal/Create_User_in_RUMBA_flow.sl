namespace: RUMBA_Terminal
flow:
  name: Create_User_in_RUMBA_flow
  inputs:
    - account_id: '10003'
    - first_name: Sushobhan
    - last_name: Das
    - address_line_1: Bangalore
    - address_line_2: India
  workflow:
    - Create_User_in_RUMBA:
        do:
          RUMBA_Terminal.Create_User_in_RUMBA:
            - account_id: '${account_id}'
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - address_line_1: '${address_line_1}'
            - address_line_2: '${address_line_2}'
        publish:
          - Signon_Complete
          - User_Added_Confirmation
          - return_result
          - error_message
        navigate:
          - SUCCESS: string_equals
          - WARNING: string_equals
          - FAILURE: on_failure
    - string_equals:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: status
            - second_string: REQUESTED ADDITION COMPLETED
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - Signon_Complete
    - User_Added_Confirmation
    - return_result
    - error_message
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Create_User_in_RUMBA:
        x: 100
        'y': 150
      string_equals:
        x: 400
        'y': 150
        navigate:
          aef38cff-228a-d25f-029e-5d8c21e17392:
            targetId: 7711bb23-e597-8f80-a767-183443e03814
            port: SUCCESS
    results:
      SUCCESS:
        7711bb23-e597-8f80-a767-183443e03814:
          x: 700
          'y': 150
