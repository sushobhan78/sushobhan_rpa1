namespace: AOS.exercise3
flow:
  name: insert_users_from_excel
  inputs:
    - excel_path: "C:\\\\RPA_TestBed_Data\\\\shopping_list.xlsx"
    - sheet: Users
    - login_header: Username
    - password_header: Password
    - email_header: Email
    - name_header: Full Name
  workflow:
    - Get_Cell:
        do_external:
          5060d8cc-d03c-43fe-946f-7babaaec589f:
            - excelFileName: '${excel_path}'
            - worksheetName: '${sheet}'
            - hasHeader: 'yes'
            - firstRowIndex: '0'
            - rowIndex: '0:1000'
            - columnIndex: '0:100'
            - rowDelimiter: '|'
            - columnDelimiter: ','
            - login_header: '${login_header}'
            - password_header: '${password_header}'
            - email_header: '${email_header}'
            - name_header: '${name_header}'
        publish:
          - data: '${returnResult}'
          - header
          - login_index: '${str(header.split(",").index(login_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - email_index: '${str(header.split(",").index(email_header))}'
          - name_index: '${str(header.split(",").index(name_header))}'
        navigate:
          - failure: on_failure
          - success: insert_user
    - insert_user:
        loop:
          for: 'row in data.split("|")'
          do:
            AOS.exercise3.insert_user:
              - login_name: '${row.split(",")[int(login_index)]}'
              - password: '${row.split(",")[int(password_index)]}'
              - email: '${row.split(",")[int(email_index)]}'
              - first_name: '${row.split(",")[int(name_index)].split()[0]}'
              - last_name: '${row.split(",")[int(name_index)].split()[-1]}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Get_Cell:
        x: 100
        'y': 150
      insert_user:
        x: 400
        'y': 150
        navigate:
          2009e59b-47f3-471a-491b-b17d5c9bb546:
            targetId: d1e08277-9cb7-e169-f1ca-15902e050f86
            port: SUCCESS
    results:
      SUCCESS:
        d1e08277-9cb7-e169-f1ca-15902e050f86:
          x: 700
          'y': 150
