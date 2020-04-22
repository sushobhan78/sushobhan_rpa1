namespace: AOS2.product
flow:
  name: add_product_to_cart
  inputs:
    - url: 'http://localhost:8080'
    - username: shobhan
    - password:
        sensitive: true
    - product_id: '29'
    - color_code: '414141'
  workflow:
    - authenticate:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: "${url+'/accountservice/AccountLoginRequest'}"
            - body: "${'<?xml version=\"1.0\" encoding=\"UTF-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"><soap:Body><AccountLoginRequest xmlns=\"com.advantage.online.store.accountservice\"><email></email><loginUser>%s</loginUser><loginPassword>%s</loginPassword></AccountLoginRequest></soap:Body></soap:Envelope>' % (username, password)}"
            - content_type: text/xml
        publish:
          - soap: '${return_result}'
        navigate:
          - SUCCESS: get_user_id
          - FAILURE: on_failure
    - get_user_id:
        do:
          io.cloudslang.base.xml.xpath_query:
            - xml_document: '${soap}'
            - xpath_query: '//ns2:userId/text()'
        publish:
          - user_id: '${selected_value}'
        navigate:
          - SUCCESS: get_auth_token
          - FAILURE: on_failure
    - get_auth_token:
        do:
          io.cloudslang.base.xml.xpath_query:
            - xml_document: '${soap}'
            - xpath_query: '//ns2:t_authorization/text()'
        publish:
          - token: '${selected_value}'
        navigate:
          - SUCCESS: add_product_to_cart
          - FAILURE: on_failure
    - add_product_to_cart:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: '${"%s/order/api/v1/carts/%s/product/%s/color/%s" % (url, user_id, product_id, color_code)}'
            - headers: '${"Authorization: Basic "+token}'
        publish:
          - cart_json: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - cart_json: '${cart_json}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      authenticate:
        x: 51
        'y': 123
      get_user_id:
        x: 51
        'y': 347
      get_auth_token:
        x: 285
        'y': 345
      add_product_to_cart:
        x: 295
        'y': 131
        navigate:
          2050a0b1-c265-ea88-29e0-d516b9b41d82:
            targetId: bd596654-7050-6dc0-62c1-1049621d8fae
            port: SUCCESS
    results:
      SUCCESS:
        bd596654-7050-6dc0-62c1-1049621d8fae:
          x: 733
          'y': 205
