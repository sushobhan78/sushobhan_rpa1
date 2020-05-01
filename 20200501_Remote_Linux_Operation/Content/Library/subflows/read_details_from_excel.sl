########################################################################################################################
#!!
#!!#
########################################################################################################################
namespace: subflows
flow:
  name: read_details_from_excel
  inputs:
    - SSH_Port:
        default: '22'
        required: false
    - excel_path: "D:\\\\RPA_TestBed\\\\server_details.xlsx"
    - sheet: Servers_N_Credentials
    - server_header: Server_DNS_Name
    - user_header: User_Name
    - password_header: Password
    - CommandSet_header: CommandSet
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
            - server_header: '${server_header}'
            - user_header: '${user_header}'
            - password_header: '${password_header}'
            - CommandSet_header: '${CommandSet_header}'
        publish:
          - data: '${return_result}'
          - header
          - server_index: '${str(header.split(",").index(server_header))}'
          - user_index: '${str(header.split(",").index(user_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - CommandSet_index: '${str(header.split(",").index(CommandSet_header))}'
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
        x: 101
        'y': 150
        navigate:
          d076cc34-43ed-e17d-7994-26a1990d028a:
            targetId: 793df4bb-5a5f-af99-a3ba-89da2078a0c9
            port: SUCCESS
    results:
      SUCCESS:
        793df4bb-5a5f-af99-a3ba-89da2078a0c9:
          x: 700
          'y': 150
