namespace: subflows
flow:
  name: run_commands_on_linux
  workflow:
    - ssh_flow:
        do:
          io.cloudslang.base.ssh.ssh_flow: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - read_commands_from_text_file:
        do:
          subflows.read_commands_from_text_file: []
        navigate:
          - FAILURE: on_failure
          - SUCCESS: ssh_flow
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      read_commands_from_text_file:
        x: 41
        'y': 218
      ssh_flow:
        x: 249
        'y': 219
        navigate:
          5f20d8f6-b344-1562-29c8-eb0b3de22723:
            targetId: 225f361c-17a2-83f4-ce0f-e8242addeddd
            port: SUCCESS
    results:
      SUCCESS:
        225f361c-17a2-83f4-ce0f-e8242addeddd:
          x: 493
          'y': 221
