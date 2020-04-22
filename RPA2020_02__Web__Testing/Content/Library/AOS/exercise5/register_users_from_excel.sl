namespace: AOS.exercise5
flow:
  name: register_users_from_excel
  inputs:
    - excel_path: "c:\\\\RPA_TestBed_Data\\\\shopping_list.xlsx"
    - sheet: Users
    - login_header: Username
    - password_header: Password
    - name_header: Full Name
    - email_header: Email
  workflow:
    - get_cell:
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
            - login_header: '${login_header}'
            - password_header: '${password_header}'
            - email_header: '${email_header}'
            - name_header: '${name_header}'
        publish:
          - data: '${return_result}'
          - header
          - login_index: '${str(header.split(",").index(login_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - email_index: '${str(header.split(",").index(email_header))}'
          - name_index: '${str(header.split(",").index(name_header))}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_cell:
        x: 55
        'y': 158
        navigate:
          22da0656-954e-d50f-c7ba-a835598c1d62:
            targetId: e35c7344-cbc4-7fe4-8dba-f5ba90df5226
            port: SUCCESS
    results:
      SUCCESS:
        e35c7344-cbc4-7fe4-8dba-f5ba90df5226:
          x: 634
          'y': 149
