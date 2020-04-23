namespace: AOS.exercise7
flow:
  name: Slice_operator__lists
  workflow:
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: |-
                ${'''
                {
                "names" : [ "Petr", "Ron", "Mike", "Lori" ]
                }
                '''}
            - json_path: $.names
        publish:
          - names: '${str(eval(return_result)[::-1])}'
          - names_with_reversed_characters: '${return_result[::-1]}'
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
          265f0738-c05a-68ac-3c4a-cfd879f75083:
            targetId: 1c46797f-3efb-9f0d-d4f8-8f9c2c8c9eaa
            port: SUCCESS
    results:
      SUCCESS:
        1c46797f-3efb-9f0d-d4f8-8f9c2c8c9eaa:
          x: 400
          'y': 150
