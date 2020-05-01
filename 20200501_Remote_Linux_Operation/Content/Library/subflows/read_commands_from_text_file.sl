namespace: subflows
flow:
  name: read_commands_from_text_file
  workflow:
    - read_commands_from_file:
        do:
          io.cloudslang.base.filesystem.read_from_file:
            - file_path: "D:\\\\RPA_TestBed\\\\CommandList.txt"
        publish:
          - read_text_from_file: '${read_text}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      read_commands_from_file:
        x: 100
        'y': 150
        navigate:
          029eb5fc-3741-2130-816c-f933702f13d7:
            targetId: 5ba3beec-4eb5-c6f3-963a-b535ca44a5b1
            port: SUCCESS
    results:
      SUCCESS:
        5ba3beec-4eb5-c6f3-963a-b535ca44a5b1:
          x: 400
          'y': 150
