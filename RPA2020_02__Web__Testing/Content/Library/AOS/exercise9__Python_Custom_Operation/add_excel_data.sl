namespace: AOS.exercise9__Python_Custom_Operation
operation:
  name: add_excel_data
  python_action:
    use_jython: false
    script: "import openpyxl\r\ndef execute(file_name, sheet_name, raw_data):\r\n    row_data_list = eval(row_data)\r\n    wb = openpyxl.load_Workbook(file_name)\r\n    if (sheet_name is None):\r\n        sheet_name = 'Sheet1'\r\n    if (sheet_name not in Wb.sheetnames):\r\n        wb.create_sheet(title=sheet_name)\r\n    sheet = wb[sheet_name]\r\n    sheet.append(row_data_list)\r\n    wb.save(file_name)"
  results:
    - SUCCESS
