namespace: AOS.exercise3
flow:
  name: insert_user
  inputs:
    - login_name: dan
    - password: dan
    - email: dan@mf.com
    - first_name: dan
    - last_name: johnson
  workflow:
    - hash_password:
        do:
          AOS.exercise3.sha1:
            - text: '${password}'
        publish:
          - password_sha1: '${sha1}'
        navigate:
          - SUCCESS: hash_name_password
    - hash_name_password:
        do:
          AOS.exercise3.sha1:
            - text: '${login_name[::-1]+password_sha1}'
        publish:
          - username_password_sha1: '${sha1}'
        navigate:
          - SUCCESS: random_number_generator
    - random_number_generator:
        do:
          io.cloudslang.base.math.random_number_generator:
            - min: '100000000'
            - max: '1000000000'
        publish:
          - user_id: '${random_number}'
        navigate:
          - SUCCESS: insert_user
          - FAILURE: on_failure
    - insert_user:
        do:
          io.cloudslang.base.database.sql_command:
            - db_server_name: "${get_sp('db_host')}"
            - db_type: PostgreSQL
            - username: "${get_sp('db_user')}"
            - password:
                value: "${get_sp('db_password')}"
                sensitive: true
            - database_name: adv_account
            - command: "${\"INSERT INTO account (user_id, user_type, active, agree_to_receive_offers, defaultpaymentmethodid, email, internallastsuccesssullogin, internalunsuccessfulloginattempts, internaluserblockedfromloginuntil, first_name, last_name, login_name, password, country_id, address, city_name) VALUES ('\"+user_id+\"', 20, 'Y', true, 0, '\"+email+\"', 0, 0, 0, '\"+first_name+\"', '\"+last_name+\"', '\"+login_name+\"', '\"+username_password_sha1+\"', 210, '', '');\"}"
            - trust_all_roots: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      hash_password:
        x: 100
        'y': 150
      hash_name_password:
        x: 400
        'y': 150
      random_number_generator:
        x: 700
        'y': 150
      insert_user:
        x: 1000
        'y': 150
        navigate:
          3729ab4a-e650-e3ca-5de0-c663947e9aa1:
            targetId: 89274101-1fb6-da82-abfb-e224a4a74302
            port: SUCCESS
    results:
      SUCCESS:
        89274101-1fb6-da82-abfb-e224a4a74302:
          x: 1300
          'y': 150
