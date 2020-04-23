namespace: AOS.exercise7
flow:
  name: split_function
  inputs:
    - list: '1,2,3,4,5'
    - list1: 1-2-3-4-5
    - list2: 1 2 3 4 5
  workflow:
    - sleep:
        loop:
          for: 'seconds in list2.split(None, 3)'
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${seconds}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      sleep:
        x: 100
        'y': 150
        navigate:
          c3f9dc0c-ba22-ce0f-ed14-2b8d3ec232dd:
            targetId: 9de071db-d323-37ea-6c6d-dac1fa79863f
            port: SUCCESS
    results:
      SUCCESS:
        9de071db-d323-37ea-6c6d-dac1fa79863f:
          x: 400
          'y': 150
