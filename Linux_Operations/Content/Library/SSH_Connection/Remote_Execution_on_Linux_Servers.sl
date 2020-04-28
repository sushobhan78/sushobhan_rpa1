########################################################################################################################
#!!
#!!#
########################################################################################################################
namespace: SSH_Connection
flow:
  name: Remote_Execution_on_Linux_Servers
  inputs:
    - SSH_Port:
        default: '22'
        required: false
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
          - SUCCESS: read_commands_from_file
          - FAILURE: on_failure
    - Run_Commands_Remotely:
        do:
          io.cloudslang.base.ssh.ssh_flow:
            - host: '${server_name}'
            - port: '${SSH_Port}'
            - command: "${Command1 + ';' + Command2 + ';' + Command3}"
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
        publish:
          - passwd_file_content: '${standard_out}'
        navigate:
          - SUCCESS: write_password_file_content_to_a_file
          - FAILURE: on_failure
    - read_commands_from_file:
        do:
          io.cloudslang.base.filesystem.read_from_file:
            - file_path: "D:\\\\RPA_TestBed\\\\CommandList.txt"
        publish:
          - Command1: '${read_text.splitlines()[0]}'
          - Command2: '${read_text.splitlines()[1]}'
          - Command3: '${read_text.splitlines()[2]}'
        navigate:
          - SUCCESS: Run_Commands_Remotely
          - FAILURE: on_failure
    - write_password_file_content_to_a_file:
        do:
          io.cloudslang.base.filesystem.write_to_file:
            - file_path: "${'D:\\\\RPA_TestBed\\\\Password_file_of_' + server_name + '.txt'}"
            - text: '${passwd_file_content}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      read_server_details:
        x: 100
        'y': 150
      read_commands_from_file:
        x: 400
        'y': 150
      write_password_file_content_to_a_file:
        x: 1000
        'y': 150
        navigate:
          85298fcf-36e4-adb1-cea4-800048ffed8a:
            targetId: f81a5110-e854-be0d-47aa-720f2c6b3870
            port: SUCCESS
      Run_Commands_Remotely:
        x: 700
        'y': 150
    results:
      SUCCESS:
        f81a5110-e854-be0d-47aa-720f2c6b3870:
          x: 1300
          'y': 150
