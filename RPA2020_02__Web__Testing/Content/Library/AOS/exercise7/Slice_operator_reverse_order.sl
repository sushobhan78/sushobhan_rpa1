namespace: AOS.exercise7
flow:
  name: Slice_operator_reverse_order
  workflow:
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"id": "12345"}'
            - json_path: $.id
        publish:
          - return_result: '${return_result[::-1]}'
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
          b419969f-559c-4bd8-e59e-b7b1dc81d8d0:
            targetId: 9fc12eec-b723-1fde-8693-464f9402d275
            port: SUCCESS
    results:
      SUCCESS:
        9fc12eec-b723-1fde-8693-464f9402d275:
          x: 400
          'y': 150
