namespace: Create_User
flow:
  name: Create_User_flow
  inputs:
    - username: das03
    - first_name: Shobhan
    - last_name: Das
    - email: das03@mf.com
    - password:
        default: Zerina34+admin
        sensitive: true
  workflow:
    - Create_User:
        do:
          Create_User.Create_User:
            - username: '${username}'
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - email: '${email}'
            - password:
                value: '${password}'
                sensitive: true
        publish:
          - user_status
          - return_result
          - error_message
        navigate:
          - SUCCESS: string_equals
          - WARNING: warning
          - FAILURE: string_equals
    - string_equals:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${user_status}'
            - second_string: "${'User %s created' % username.upper()}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - user_status
    - return_result
    - error_message
  results:
    - SUCCESS
    - FAILURE
    - warning
extensions:
  graph:
    steps:
      Create_User:
        x: 100
        'y': 150
        navigate:
          754358f3-b76f-233c-795b-a7ef357238a4:
            targetId: 2825a7fe-5818-9c04-e026-6d15865a39c9
            port: WARNING
      string_equals:
        x: 400
        'y': 150
        navigate:
          ff7fee64-7f4b-64cc-8f69-23a58b83ac97:
            targetId: d3693a2e-ab3e-9b2f-89e9-5434f277aa5d
            port: SUCCESS
    results:
      SUCCESS:
        d3693a2e-ab3e-9b2f-89e9-5434f277aa5d:
          x: 700
          'y': 150
      warning:
        2825a7fe-5818-9c04-e026-6d15865a39c9:
          x: 201
          'y': 289
