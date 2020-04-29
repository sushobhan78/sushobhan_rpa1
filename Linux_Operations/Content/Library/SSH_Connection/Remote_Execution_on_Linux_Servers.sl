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
    - excel_path: "D:\\\\RPA_TestBed\\\\server_details.xlsx"
    - sheet: Servers_N_Credentials
    - servername_header: Server_DNS_Name
    - username_header: User_Name
    - password_header: Password
    - commandset_header: CommandSet
  workflow:
    - Read_Servers_N_User_Credentials:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: '${excel_path}'
            - worksheet_name: '${sheet}'
            - has_header: 'yes'
            - first_row_index: '0'
            - row_index: '0:1000'
            - column_index: '0:100'
            - row_delimiter: '|'
            - column_delimiter: ','
        publish:
          - data: '${return_result}'
          - header
          - servername_index: '${str(header.split(",").index(servename_header))}'
          - username_index: '${str(header.split(",").index(username_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - commandset_index: '${str(header.split(",").index(commandset_header))}'
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
        loop:
          for: 'row in data.split("|")'
          do:
            io.cloudslang.base.filesystem.read_from_file:
              - file_path: "${'D:\\\\RPA_TestBed\\\\' + row.split(\",\")[int(commandset_index)]}"
          break:
            - FAILURE
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
      Read_Servers_N_User_Credentials:
        x: 100
        'y': 150
      read_commands_from_file:
        x: 400
        'y': 150
      Run_Commands_Remotely:
        x: 401
        'y': 374
      write_password_file_content_to_a_file:
        x: 1000
        'y': 150
        navigate:
          9253336f-1853-fd61-786b-66603644d764:
            targetId: d7d9c2f5-a5f8-df55-57a9-bce8ee11fa00
            port: SUCCESS
    results:
      SUCCESS:
        d7d9c2f5-a5f8-df55-57a9-bce8ee11fa00:
          x: 1300
          'y': 150
