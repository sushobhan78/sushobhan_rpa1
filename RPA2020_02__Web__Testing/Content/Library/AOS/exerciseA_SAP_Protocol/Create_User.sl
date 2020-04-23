namespace: AOS.exerciseA_SAP_Protocol
operation:
  name: Create_User
  sequential_action:
    gav: com.microfocus.seq:AOS.exerciseA_SAP_Protocol.Create_User:1.0.0
    skills:
    - SAP
    - SAP NWBC Desktop
    - SAPUI5
    - SAPWDJ
    - SAPWebExt
    - Web
    settings:
      sap:
        active: true
        auto_log_on: true
        client: '001'
        close_on_exit: true
        ignore_existing_sessions: true
        language: EN
        password: Cloud@123
        remember_password: false
        server: INTERNAL
        user: admin
      windows:
        active: false
      web:
        active: false
        close_on_exit: false
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Window
      name: Window
      properties:
      - property:
          value:
            value: Shell_TrayWnd
            regular_expression: false
          name: regexpwndclass
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is owned window
          hidden: false
          read_only: false
          type: BOOL
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is child window
          hidden: false
          read_only: false
          type: BOOL
      basic_identification:
        property_ref:
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: Shell_TrayWnd
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Thursday, April 23, 2020 12:50:26 PM
      child_objects:
      - object:
          class: WinObject
          name: Running applications
          properties:
          - property:
              value:
                value: MSTaskListWClass
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: MSTaskListWClass
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, April 23, 2020 12:50:26 PM
          child_objects: []
  check_points_and_outputs: []
  parameters: []
