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
            - remoteFile: /root/check_broadband_speed.sh
            - privateKeyFile: "D:\\\\ssh_key\\\\sedl006__private_key__20180730.ppk"
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
        x: 100
        'y': 150
        navigate:
          5c3cade9-b6fd-afef-f771-056550484915:
            targetId: fd896aaa-2751-a121-3488-9a998a258ffe
            port: success
    results:
      SUCCESS:
        fd896aaa-2751-a121-3488-9a998a258ffe:
          x: 400
          'y': 150
