namespace: AOS2.product
flow:
  name: insert_user
  inputs:
    - login_name: test1
    - password: test1
    - email: test1@test1.com
    - first_name: Test1
    - last_name: Test11
  workflow:
    - hash_password:
        do:
          AOS2.product.sub-flows.sha1:
            - text: '${password}'
        publish:
          - password_sha1: '${sha1}'
        navigate:
          - SUCCESS: hash_name_password
    - hash_name_password:
        do:
          AOS2.product.sub-flows.sha1:
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
            - db_server_name: "${get_sp('db_host1')}"
            - db_type: PostgreSQL
            - username: "${get_sp('db_user1')}"
            - password:
                value: "${get_sp('db_password1')}"
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
        x: 43
        'y': 163
      hash_name_password:
        x: 43
        'y': 336
      random_number_generator:
        x: 258
        'y': 179
      insert_user:
        x: 269
        'y': 335
        navigate:
          18158ae1-9004-f0a7-714b-7fb25e9aad3a:
            targetId: 86439079-644b-b909-04f2-02125a883ed9
            port: SUCCESS
    results:
      SUCCESS:
        86439079-644b-b909-04f2-02125a883ed9:
          x: 514
          'y': 410
