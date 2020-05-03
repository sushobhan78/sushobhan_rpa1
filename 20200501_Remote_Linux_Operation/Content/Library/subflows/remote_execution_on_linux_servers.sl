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
  workflow:
    - read_details_from_excel:
        do:
          subflows.read_details_from_excel:
            - server_header: '${server_header}'
            - user_header: '${user_header}'
            - password_header: '${password_header}'
            - CommandSet_header: '${CommandSet_header}'
        publish:
          - data: '${returnResult}'
          - header
          - server_index: '${str(header.split(",").index(server_header))}'
          - user_index: '${str(header.split(",").index(user_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - CommandSet_index: '${str(header.split(",").index(CommandSet_header))}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: read_commands_from_text_file
    - read_commands_from_text_file:
        do:
          subflows.read_commands_from_text_file:
            - input_0: '${CommandSet_index[0]}'
        publish:
          - output_0: output_0
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      read_details_from_excel:
        x: 99
        'y': 149
      read_commands_from_text_file:
        x: 400
        'y': 150
        navigate:
          c0d537b6-6205-071e-bf4f-70f07e2a42fc:
            targetId: 96de3c80-e790-d69b-74ef-c759275a4276
            port: SUCCESS
    results:
      SUCCESS:
        96de3c80-e790-d69b-74ef-c759275a4276:
          x: 700
          'y': 150
