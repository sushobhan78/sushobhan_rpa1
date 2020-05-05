namespace: subflows
flow:
  name: scp_a_file
  workflow:
    - Secure_Copy:
        do_external:
          d40f2f20-f167-4812-96af-ac74cbaedf69:
            - host: savana.hpeswlab.net
            - port: '22'
            - username: root
            - password:
                value: 'Zerina34@dm!n'
                sensitive: true
            - localFile: "D:\\\\RPA_TestBed\\\\check_broadband_speed.sh"
            - copyAction: to
            - remoteFile: /sdas/check_broadband_speed.sh
            - privateKeyFile: "D:\\\\ssh_key\\\\sedl006__private_key__20180730.ppk"
        publish:
          - host
          - port
          - username
          - password
          - remoteFile
          - privateKeyFile
        navigate:
          - success: ssh_flow
          - failure: on_failure
    - ssh_flow:
        do:
          io.cloudslang.base.ssh.ssh_flow:
            - host: '${host}'
            - port: '${port}'
            - command: 'chmod 777 /sdas/check_broadband_speed.sh; dos2unix /sdas/check_broadband_speed.sh &&;/sdas/check_broadband_speed.sh'
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
            - private_key_file: '${privateKeyFile}'
            - smart_recovery: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Secure_Copy:
        x: 99
        'y': 149
      ssh_flow:
        x: 400
        'y': 150
        navigate:
          43fd0643-6fd3-6aed-3bd6-61a80747f3cc:
            targetId: b74ecc5f-c343-25b3-295c-08de7d9e95e3
            port: SUCCESS
    results:
      SUCCESS:
        b74ecc5f-c343-25b3-295c-08de7d9e95e3:
          x: 700
          'y': 150
