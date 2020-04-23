namespace: AOS.exercise7
flow:
  name: http_client_action
  workflow:
    - http_client_action:
        do:
          io.cloudslang.base.http.http_client_action:
            - url: 'https://robotic.swinfra.net:8446/oo-ssx'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      http_client_action:
        x: 100
        'y': 151
        navigate:
          7647c0a2-547d-57ed-2505-c8934426caba:
            targetId: b242819b-e20f-7aa0-22b1-0c33aabc69c2
            port: SUCCESS
    results:
      SUCCESS:
        b242819b-e20f-7aa0-22b1-0c33aabc69c2:
          x: 400
          'y': 150
