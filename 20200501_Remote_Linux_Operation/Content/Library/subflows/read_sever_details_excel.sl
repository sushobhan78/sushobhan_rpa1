namespace: subflows
flow:
  name: read_sever_details_excel
  workflow:
    - read_server_details:
        do:
          io.cloudslang.base.filesystem.read_from_file:
            - file_path: "D:\\\\RPA_TestBed\\\\Linux_Server_Details.txt"
        publish:
          - server_name: '${read_text.splitlines()[0]}'
          - username: '${read_text.splitlines()[1]}'
          - password: '${read_text.splitlines()[2]}'
        navigate:
          - FAILURE: on_failure
  results:
    - FAILURE
extensions:
  graph:
    steps:
      read_server_details:
        x: 46
        'y': 142
