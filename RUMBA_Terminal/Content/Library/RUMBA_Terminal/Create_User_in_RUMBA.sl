namespace: RUMBA_Terminal
operation:
  name: Create_User_in_RUMBA
  inputs:
    - account_id
    - first_name
    - last_name
    - address_line_1
    - address_line_2
  sequential_action:
    gav: 'com.microfocus.seq:RUMBA_Terminal.Create_User_in_RUMBA:1.0.0'
    skills:
      - Terminal Emulators
    settings:
      windows:
        active: false
      terminal_settings:
        active: true
        current_emulator: Rumba 9.5
    steps:
      - step:
          id: '1'
          object_path: 'TeWindow("TeWindow").TeScreen("Si").TeField("USERID")'
          action: Set
          default_args: '"SYSAD"'
          snapshot: ".\\Snapshots\\ssf1.png"
          highlight_id: '746'
          args: "${get_sp('rumba_admin_name')}"
      - step:
          id: '2'
          object_path: 'TeWindow("TeWindow").TeScreen("Si").TeField("Password")'
          action: SetSecure
          default_args: '"SYSAD"'
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '826'
          args: "${get_sp('rumba_admin_password')}"
      - step:
          id: '3'
          object_path: 'TeWindow("TeWindow").TeScreen("Si").TeField("Password")'
          action: SetCursorPos
          default_args: '5'
          snapshot: ".\\Snapshots\\ssf3.png"
          highlight_id: '826'
      - step:
          id: '4'
          object_path: 'TeWindow("TeWindow").TeScreen("Si")'
          action: SendKey
          default_args: TE_ENTER
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '7958'
      - step:
          id: '5'
          object_path: 'TeWindow("TeWindow").TeScreen("Si")'
          action: Sync
      - step:
          id: '6'
          object_path: 'TeWindow("TeWindow").TeScreen("CASSE0012I Signon complete")'
          action: Output
          default_args: 'CheckPoint("Signon_Complete")'
      - step:
          id: '7'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCTE0012I Signon complete")'
          action: SendKey
          default_args: '"ACCT"'
          snapshot: ".\\Snapshots\\ssf5.png"
          highlight_id: '7213'
      - step:
          id: '8'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCTE0012I Signon complete")'
          action: SetCursorPos
          default_args: '1,5'
          snapshot: ".\\Snapshots\\ssf6.png"
          highlight_id: '7213'
      - step:
          id: '9'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCTE0012I Signon complete")'
          action: SendKey
          default_args: TE_ENTER
          snapshot: ".\\Snapshots\\ssf7.png"
          highlight_id: '7213'
      - step:
          id: '10'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCTE0012I Signon complete")'
          action: Sync
      - step:
          id: '11'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: MENU").TeField("REQUEST TYPE")'
          action: Set
          default_args: '"A"'
          snapshot: ".\\Snapshots\\ssf8.png"
          highlight_id: '662'
      - step:
          id: '12'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: MENU").TeField("ACCOUNT")'
          action: Set
          default_args: '"10002"'
          snapshot: ".\\Snapshots\\ssf9.png"
          highlight_id: '675'
          args: 'Parameter("account_id")'
      - step:
          id: '13'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: MENU").TeField("PRINTER")'
          action: SetCursorPos
          snapshot: ".\\Snapshots\\ssf10.png"
          highlight_id: '692'
      - step:
          id: '14'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: MENU")'
          action: SendKey
          default_args: TE_ENTER
          snapshot: ".\\Snapshots\\ssf11.png"
          highlight_id: '9864'
      - step:
          id: '15'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: MENU")'
          action: Sync
      - step:
          id: '16'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("SURNAME")'
          action: Set
          default_args: '"Das"'
          snapshot: ".\\Snapshots\\ssf12.png"
          highlight_id: '197'
          args: 'Parameter("last_name")'
      - step:
          id: '17'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("FIRST")'
          action: Set
          default_args: '"Sushobhan"'
          snapshot: ".\\Snapshots\\ssf13.png"
          highlight_id: '277'
          args: 'Parameter("first_name")'
      - step:
          id: '18'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("ADDRESS")'
          action: Set
          default_args: '"Bangalore"'
          snapshot: ".\\Snapshots\\ssf14.png"
          highlight_id: '357'
          args: 'Parameter("address_line_1")'
      - step:
          id: '19'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("field437")'
          action: Set
          default_args: '"India"'
          snapshot: ".\\Snapshots\\ssf15.png"
          highlight_id: '437'
          args: 'Parameter("address_line_2")'
      - step:
          id: '20'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("NO CARDS ISSUED")'
          action: Set
          default_args: '"1"'
          snapshot: ".\\Snapshots\\ssf16.png"
          highlight_id: '900'
      - step:
          id: '21'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("DATE ISSUED")'
          action: Set
          default_args: '"04"'
          snapshot: ".\\Snapshots\\ssf17.png"
          highlight_id: '919'
      - step:
          id: '22'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("DATE ISSUED_2")'
          action: Set
          default_args: '"23"'
          snapshot: ".\\Snapshots\\ssf18.png"
          highlight_id: '922'
      - step:
          id: '23'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("DATE ISSUED_3")'
          action: Set
          default_args: '"20"'
          snapshot: ".\\Snapshots\\ssf19.png"
          highlight_id: '925'
      - step:
          id: '24'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("REASON")'
          action: Set
          default_args: '"N"'
          snapshot: ".\\Snapshots\\ssf20.png"
          highlight_id: '941'
      - step:
          id: '25'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("CARD CODE")'
          action: Set
          default_args: '"1"'
          snapshot: ".\\Snapshots\\ssf21.png"
          highlight_id: '973'
      - step:
          id: '26'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("APPROVED BY")'
          action: Set
          default_args: '"GW"'
          snapshot: ".\\Snapshots\\ssf22.png"
          highlight_id: '999'
      - step:
          id: '27'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD").TeField("APPROVED BY")'
          action: SetCursorPos
          default_args: '2'
          snapshot: ".\\Snapshots\\ssf23.png"
          highlight_id: '999'
      - step:
          id: '28'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD")'
          action: SendKey
          default_args: TE_ENTER
          snapshot: ".\\Snapshots\\ssf24.png"
          highlight_id: '13420'
      - step:
          id: '29'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: NEW RECORD")'
          action: Sync
      - step:
          id: '30'
          object_path: 'TeWindow("TeWindow").TeScreen("ACCOUNT FILE: MENU").TeField("REQUESTED(protected)")'
          action: Output
          default_args: 'CheckPoint("User_Added_Confirmation")'
  outputs:
    - Signon_Complete:
        robot: true
        value: '${Signon_Complete}'
    - User_Added_Confirmation:
        robot: true
        value: '${User_Added_Confirmation}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification:
          base_filter: ''
          optional_filter: ''
          algorithm: Mercury.TolerantPriority
          active: true
        name: TeWindow
        child_objects:
          - object:
              smart_identification: ''
              name: Si
              child_objects:
                - object:
                    smart_identification: ''
                    name: USERID
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: USERID
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Password
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: Password
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label row
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '30'
                      regular_expression: false
                    name: screen label length
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label column
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: Si
                      regular_expression: false
                    name: label
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay: ''
              class: TeScreen
              visual_relations: ''
              last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
              basic_identification:
                property_ref:
                  - screen label row
                  - screen label length
                  - screen label column
                  - label
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: CASSE0012I Signon complete
              child_objects: []
              properties:
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label row
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '30'
                      regular_expression: false
                    name: screen label length
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label column
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: CASSE0012I Signon complete at
                      regular_expression: false
                    name: label
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay: ''
              class: TeScreen
              visual_relations: ''
              last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
              basic_identification:
                property_ref:
                  - screen label row
                  - screen label length
                  - screen label column
                  - label
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: ACCTE0012I Signon complete
              child_objects: []
              properties:
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label row
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '30'
                      regular_expression: false
                    name: screen label length
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label column
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: ACCTE0012I Signon complete at
                      regular_expression: false
                    name: label
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: TeScreen
              visual_relations: ''
              last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
              basic_identification:
                property_ref:
                  - screen label row
                  - screen label length
                  - screen label column
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: 'ACCOUNT FILE: NEW RECORD'
              child_objects:
                - object:
                    smart_identification: ''
                    name: SURNAME
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: SURNAME
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: REASON
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: REASON
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: NO CARDS ISSUED
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: NO CARDS ISSUED
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: FIRST
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: FIRST
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: field437
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: field437
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: DATE ISSUED_3
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: DATE ISSUED
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier:
                        value: 2
                        type: index
                - object:
                    smart_identification: ''
                    name: DATE ISSUED_2
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: DATE ISSUED
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier:
                        value: 1
                        type: index
                - object:
                    smart_identification: ''
                    name: DATE ISSUED
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: DATE ISSUED
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier:
                        value: 0
                        type: index
                - object:
                    smart_identification: ''
                    name: CARD CODE
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: CARD CODE
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: APPROVED BY
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: APPROVED BY
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: ADDRESS
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: ADDRESS
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label row
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '30'
                      regular_expression: false
                    name: screen label length
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label column
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'ACCOUNT FILE: NEW RECORD'
                      regular_expression: false
                    name: label
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay: ''
              class: TeScreen
              visual_relations: ''
              last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
              basic_identification:
                property_ref:
                  - screen label row
                  - screen label length
                  - screen label column
                  - label
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: 'ACCOUNT FILE: MENU'
              child_objects:
                - object:
                    smart_identification: ''
                    name: REQUESTED(protected)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: REQUESTED(protected)
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: REQUEST TYPE
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: REQUEST TYPE
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: PRINTER
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: PRINTER
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: ACCOUNT
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: protected
                          hidden: false
                          read_only: false
                          type: BOOL
                      - property:
                          value:
                            value: ACCOUNT
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: TeField
                    visual_relations: ''
                    last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
                    basic_identification:
                      property_ref:
                        - protected
                        - attached text
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label row
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '30'
                      regular_expression: false
                    name: screen label length
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: screen label column
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'ACCOUNT FILE: MENU'
                      regular_expression: false
                    name: label
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay: ''
              class: TeScreen
              visual_relations: ''
              last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
              basic_identification:
                property_ref:
                  - screen label row
                  - screen label length
                  - screen label column
                  - label
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: 'Yes'
                regular_expression: false
              name: terminal emulator
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: A
                regular_expression: false
              name: short name
              hidden: false
              read_only: false
              type: STRING
        comments: ''
        custom_replay: ''
        class: TeWindow
        visual_relations: ''
        last_update_time: 'Thursday, April 23, 2020 2:36:59 PM'
        basic_identification:
          property_ref:
            - terminal emulator
            - short name
          ordinal_identifier: ''
  check_points_and_outputs:
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value: ''
              visual_relations: ''
              parameter:
                value: User_Added_Confirmation
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: text
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: User_Added_Confirmation
        type: Output
        class: VerifyObj
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value: ''
              visual_relations: ''
              parameter:
                value: Signon_Complete
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: label
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: Signon_Complete
        type: Output
        class: VerifyObj
  parameters: []
