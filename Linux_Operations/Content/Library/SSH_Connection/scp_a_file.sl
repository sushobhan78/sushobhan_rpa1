namespace: SSH_Connection
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
            - remoteFile: /root/check_broadband_speed.sh
        navigate:
          - success: SUCCESS
          - failure: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Secure_Copy:
        x: 73
        'y': 184
        navigate:
          e3cf3b82-c033-c841-13cb-1f4bb7463b16:
            targetId: 2a858c52-f014-ccf4-6b6e-38f1e5b55b83
            port: success
    results:
      SUCCESS:
        2a858c52-f014-ccf4-6b6e-38f1e5b55b83:
          x: 322
          'y': 187
