namespace: SSH_Connection
operation:
  name: Collect_Commands
  inputs:
    - file_name
  python_action:
    use_jython: false
    script: "def execute(file_name):\r\n\r\nfile = open(\"D:\\\\RPA_TestBed\\\\\" + file_name, \"r\")\r\n\r\nfor x in file:\r\n  x = x.rstrip('\\n')\r\n  output += x\r\n  output += ';'\r\n\r\noutput = output.rstrip(';')\r\nreturn locals()"
  outputs:
    - CommandsList
  results:
    - SUCCESS
