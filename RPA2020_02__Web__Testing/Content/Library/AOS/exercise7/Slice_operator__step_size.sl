namespace: AOS.exercise7
flow:
  name: Slice_operator__step_size
  workflow:
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"id": "12345"}'
            - json_path: $.id
        publish:
          - id: '${return_result[::2]}'
          - id1: '${return_result[1:-1:2]}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      json_path_query:
        x: 100
        'y': 150
        navigate:
          b67df833-e533-d4b6-e96f-3828b01822ab:
            targetId: 9627a897-ea22-a7f1-69b4-822b0bc1f6f8
            port: SUCCESS
    results:
      SUCCESS:
        9627a897-ea22-a7f1-69b4-822b0bc1f6f8:
          x: 400
          'y': 150
