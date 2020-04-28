########################################################################################################################
#!!
#! @input SSH_Hostname: Provide Linux Hostname for this operation
#!!#
########################################################################################################################
namespace: SSH_Connection
flow:
  name: Make_SSH_Connection
  inputs:
    - SSH_Hostname: savana.hpeswlab.net
    - username: root
    - password:
        default: 'Zerina34@dm!n'
        sensitive: true
    - SSH_Port:
        default: '22'
        required: false
  workflow:
    - ssh_flow:
        do:
          io.cloudslang.base.ssh.ssh_flow:
            - host: '${SSH_Hostname}'
            - port: '${SSH_Port}'
            - command: ls; useradd sdas1
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      ssh_flow:
        x: 100
        'y': 150
        navigate:
          c73f7868-08a3-f33d-c40b-edcf00886143:
            targetId: f07871d1-5c75-dc6e-478b-b8ab7f5c284d
            port: SUCCESS
    results:
      SUCCESS:
        f07871d1-5c75-dc6e-478b-b8ab7f5c284d:
          x: 400
          'y': 150
