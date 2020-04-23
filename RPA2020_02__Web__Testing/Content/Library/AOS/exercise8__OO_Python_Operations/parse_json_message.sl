namespace: AOS.exercise8__OO_Python_Operations
operation:
  name: parse_json_message
  inputs:
    - json_string
  python_action:
    use_jython: false
    script: "import json\r\ndef execute(json_string):\r\n  data = json.loads(json_string)\r\n  message_id = data['id']\r\n  subject = data['subject']\r\n\r\n  emailAddress = data['sender']['emailAddress']\r\n  sender_name = emailAddress['name']\r\n  sender_email = emailAddress['address']\r\n\r\n  #todo handle multiple recipients\r\n  emailAddress = data['toRecipients'][0]['emailAddress']\r\n  recipient_name = emailAddress['name']\r\n  recipient_email = emailAddress['address']\r\n\r\n  body = data['body']\r\n  content_type = body['contentType']\r\n  content = body['content']\r\n\r\n  has_attachments = str(data['hasAttachments'])\r\n  return locals()"
  outputs:
    - message_id: '${message_id}'
    - subject: '${subject}'
    - content: '${content}'
    - content_type: '${content_type}'
    - sender_name: '${sender_name}'
    - sender_email: '${sender_email}'
    - recipient_name: '${recipient_name}'
    - recipient_email: '${recipient_email}'
    - has_attachments: '${has_attachments}'
  results:
    - SUCCESS
