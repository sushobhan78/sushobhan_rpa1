namespace: subflows
flow:
  name: remote_execution_on_linux_servers
  inputs:
    - excel_file: "D:\\\\RPA_TestBed\\\\server_details.xlsx"
    - excel_sheet: Servers_N_Credentials
    - server_header: Server_DNS_Name
    - user_header: User_Name
    - password_header: Password
    - CommandSet_header: CommandSet
  results: []
