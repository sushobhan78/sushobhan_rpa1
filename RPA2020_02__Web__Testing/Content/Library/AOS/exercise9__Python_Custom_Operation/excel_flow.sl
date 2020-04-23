namespace: AOS.exercise9__Python_Custom_Operation
flow:
  name: excel_flow
  workflow:
    - delete:
        do:
          io.cloudslang.base.filesystem.delete: []
        navigate:
          - SUCCESS: new_excel_document
          - FAILURE: new_excel_document
    - new_excel_document:
        do:
          AOS.exercise9__Python_Custom_Operation.new_excel_document: []
        navigate:
          - SUCCESS: add_excel_data
    - add_excel_data:
        do:
          AOS.exercise9__Python_Custom_Operation.add_excel_data: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      delete:
        x: 76
        'y': 176
      new_excel_document:
        x: 246
        'y': 177
      add_excel_data:
        x: 425
        'y': 180
        navigate:
          507722bc-291d-54a8-a393-1113542ac48a:
            targetId: cc187d5e-0963-590e-f455-ed4eb223d07d
            port: SUCCESS
    results:
      SUCCESS:
        cc187d5e-0963-590e-f455-ed4eb223d07d:
          x: 596
          'y': 173
