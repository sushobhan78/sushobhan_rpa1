namespace: AOS.exercise5
flow:
  name: register_user_act_flow
  inputs:
    - url: 'http://compass.swinfra.net:8080'
    - username: Dan
    - password: Dan34
    - first_name: Daniel
    - last_name: Greensberg
    - email: dan@microfocus.com
  workflow:
    - register_user_act:
        do:
          AOS.register_user_act:
            - url: '${url}'
            - username: '${username}'
            - password: '${password}'
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - email: '${email}'
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
extensions:
  graph:
    steps:
      register_user_act:
        x: 100
        'y': 150
        navigate:
          141ffe19-3b40-8e4c-d250-c92a44f230cb:
            targetId: d53f99bd-c560-9033-a621-fac91d82642f
            port: SUCCESS
          30a50558-958f-51ef-4c85-356d17851360:
            targetId: d53f99bd-c560-9033-a621-fac91d82642f
            port: WARNING
    results:
      SUCCESS:
        d53f99bd-c560-9033-a621-fac91d82642f:
          x: 400
          'y': 150
