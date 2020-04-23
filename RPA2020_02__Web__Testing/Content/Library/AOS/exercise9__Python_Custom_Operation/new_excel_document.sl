namespace: AOS.exercise9__Python_Custom_Operation
operation:
  name: new_excel_document
  inputs:
    - file_name
    - Sheet_name:
        required: false
        default: Sheet1
    - header_data:
        required: false
    - delimiter: ','
  python_action:
    use_jython: false
    script: "import openpyxl\r\nfrom openpyxl import Workbook\r\ndef execute(file_name, sheet_name, header_data):\r\n    wb = Workbook()\r\n    sheet = wb.active\r\n    if (sheet_name is None):\r\n        sheet_name = 'Sheet1'\r\n    sheet.title = sheet_name\r\n    if (header_data is not None):\r\n        sheet.append(eval(header_data))\r\n    wb.save(file_name)"
  results:
    - SUCCESS
