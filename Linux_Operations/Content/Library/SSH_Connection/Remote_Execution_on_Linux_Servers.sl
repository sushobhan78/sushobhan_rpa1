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
          - SUCCESS: Remote_Execution_on_Linux_Servers
          - FAILURE: on_failure
    - Remote_Execution_on_Linux_Servers:
        loop:
          for: row in commandset_index
          do:
            SSH_Connection.Remote_Execution_on_Linux_Servers: []
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Read_Servers_N_User_Credentials:
        x: 100
        'y': 150
      Remote_Execution_on_Linux_Servers:
        x: 400
        'y': 150
        navigate:
          af4cac68-24af-381f-5c0f-f78ae117a84d:
            targetId: 793df4bb-5a5f-af99-a3ba-89da2078a0c9
            port: SUCCESS
    results:
      SUCCESS:
        793df4bb-5a5f-af99-a3ba-89da2078a0c9:
          x: 700
          'y': 150
