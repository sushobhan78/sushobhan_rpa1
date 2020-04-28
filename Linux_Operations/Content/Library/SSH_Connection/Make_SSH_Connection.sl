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
    - Linux_Server_Details: "D:\\\\RPA_TestBed\\\\Linux_Server_Details.txt"
    - CommandList: "D:\\\\RPA_TestBed\\\\CommandList.txt"
  workflow:
    - read_server_details:
        do:
          io.cloudslang.base.filesystem.read_from_file: []
        navigate:
          - SUCCESS: read_commands_from_file
          - FAILURE: on_failure
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
    - read_commands_from_file:
        do:
          io.cloudslang.base.filesystem.read_from_file: []
        navigate:
          - SUCCESS: ssh_flow
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      read_server_details:
        x: 100
        'y': 150
      read_commands_from_file:
        x: 400
        'y': 150
      ssh_flow:
        x: 700
        'y': 150
        navigate:
          40b5a668-02fd-1eb0-d239-3f720fac8067:
            targetId: 2cd12913-6d97-29dc-c4cf-3283eae0428e
            port: SUCCESS
    results:
      SUCCESS:
        2cd12913-6d97-29dc-c4cf-3283eae0428e:
          x: 1000
          'y': 150
