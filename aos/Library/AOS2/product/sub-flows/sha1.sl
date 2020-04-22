namespace: AOS2.product.sub-flows
operation:
  name: sha1
  inputs:
    - text
  python_action:
    use_jython: false
    script: "import hashlib\r\ndef execute(text):\r\n    return { 'sha1': hashlib.sha1(text.encode('utf-8')).hexdigest() }"
  outputs:
    - sha1: '${sha1}'
  results:
    - SUCCESS
