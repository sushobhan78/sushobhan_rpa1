########################################################################################################################
#!!
#!!#
########################################################################################################################
namespace: SSH_Connection
flow:
  name: Run_Commands_In_Linux_Server_And_Fetch_Results
  inputs:
    - CommandSetFile: "D:\\\\RPA_TestBed\\\\Linux_Server_Details.txt"
    - server_name: savana.hpeswlab.net
    - ssh_port_no: '22'
    - user_name: root
    - password: 'Zerina34@dm!n'
    - remote_execution__standard_out_file: 2020_04_30.txt
    - remote_execution__standard_err_file: 2020_04_30err.txt
    - remote_execution__return_result_file: 2020_04_30_return_result.txt
  workflow:
    - read_commands_from_file:
        do:
          io.cloudslang.base.filesystem.read_from_file:
            - file_path: '${CommandSetFile}'
        publish:
          - Commands: "${def execute(read_text):\nfor x in read_text:\n  x = x.rstrip('\\n')\n  output += x\n  output += ';'\n\nf.close()\nreturn output.rstrip(';')}"
        navigate:
          - SUCCESS: Run_Commands_Remotely
          - FAILURE: on_failure
    - Run_Commands_Remotely:
        do:
          io.cloudslang.base.ssh.ssh_flow:
            - host: '${server_name}'
            - port: '${ssh_port_no}'
            - command: "${Command1 + ';' + Command2 + ';' + Command3}"
            - username: '${user_name}'
            - password:
                value: '${password}'
                sensitive: true
        publish:
          - standard_out
          - return_result
          - standard_err
        navigate:
          - SUCCESS: write_password_file_content_to_a_file
          - FAILURE: on_failure
    - write_password_file_content_to_a_file:
        do:
          io.cloudslang.base.filesystem.write_to_file:
            - file_path: "${'D:\\\\RPA_TestBed\\\\' + remote_execution__standard_out_file}"
            - text: '${Commands}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - remote_execution__return_result
    - remote_execution__standard_out
    - remote_execution__standard_err
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      read_commands_from_file:
        x: 400
        'y': 150
      Run_Commands_Remotely:
        x: 700
        'y': 149
      write_password_file_content_to_a_file:
        x: 1000
        'y': 150
        navigate:
          85298fcf-36e4-adb1-cea4-800048ffed8a:
            targetId: f81a5110-e854-be0d-47aa-720f2c6b3870
            port: SUCCESS
    results:
      SUCCESS:
        f81a5110-e854-be0d-47aa-720f2c6b3870:
          x: 1300
          'y': 150
