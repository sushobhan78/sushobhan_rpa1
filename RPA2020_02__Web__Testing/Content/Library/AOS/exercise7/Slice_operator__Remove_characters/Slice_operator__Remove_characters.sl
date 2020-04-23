namespace: AOS.exercise7.Slice_operator__Remove_characters
flow:
  name: Slice_operator__Remove_characters
  workflow:
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"id": "12345"}'
            - json_path: $.id
        publish:
          - id: '${return_result[1:-1]}'
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
          0e4216bf-e4cd-9269-bfa3-a7a823514c0b:
            targetId: 57e81abe-b2f4-1873-a04b-b155a475cb05
            port: SUCCESS
    results:
      SUCCESS:
        57e81abe-b2f4-1873-a04b-b155a475cb05:
          x: 400
          'y': 150
