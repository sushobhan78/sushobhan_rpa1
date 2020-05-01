namespace: SSH_Connection
operation:
  name: Collect_Commands
  inputs:
    - text
  python_action:
    use_jython: false
    script: "def execute(read_text):\r\nfor x in read_text:\r\n  x = x.rstrip('\\n')\r\n  output += x\r\n  output += ';'\r\n\r\noutput = output.rstrip(';')\r\nreturn locals()"
  outputs:
    - operation_output_0
  results:
    - SUCCESS
