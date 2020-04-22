namespace: AOS2.product
flow:
  name: insert_users_from_excel
  inputs:
    - excel_path: "C:\\\\Temp\\\\shopping_list.xlsx"
    - sheet: Users
    - login_header: Username
    - password_header: Password
    - name_heder: Full Name
    - email_header: Email
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
            - name_header: '${name_heder}'
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
            AOS2.product.insert_user:
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
        x: 175
        'y': 158
      insert_user:
        x: 394
        'y': 162
        navigate:
          de84b086-fc89-d051-4fd0-b69ba60a0228:
            targetId: e65a07a8-5e00-17fd-2983-3efa630a500e
            port: SUCCESS
    results:
      SUCCESS:
        e65a07a8-5e00-17fd-2983-3efa630a500e:
          x: 712
          'y': 154
