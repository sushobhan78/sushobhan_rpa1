namespace: SSH_Connection
flow:
  name: wrapper_collect_command
  workflow:
    - Collect_Commands:
        do:
          SSH_Connection.Collect_Commands:
            - file_name: CommandList.txt
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Collect_Commands:
        x: 305
        'y': 144
        navigate:
          c989568e-2136-c65b-ae57-c632bccff869:
            targetId: c4d6534b-f15c-60de-e86e-c4b89bb8eeea
            port: SUCCESS
    results:
      SUCCESS:
        c4d6534b-f15c-60de-e86e-c4b89bb8eeea:
          x: 537
          'y': 145
