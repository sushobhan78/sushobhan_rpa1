namespace: AOS2.product.sub-flows
flow:
  name: iterate_categories
  inputs:
    - json
    - category_id
    - file_path
  workflow:
    - get_category:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: '${"$[?(@.categoryId == "+category_id+")]"}'
        publish:
          - category_json: '${return_result}'
        navigate:
          - SUCCESS: get_category_name
          - FAILURE: on_failure
    - iterate_products:
        loop:
          for: product_id in product_ids
          do:
            AOS2.product.sub-flows.iterate_products:
              - json: '${category_json}'
              - category_name: '${category_name}'
              - category_id: '${category_id}'
              - file_path: '${file_path}'
              - product_id: '${product_id}'
          break: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - get_category_name:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${category_json}'
            - json_path: '$.*.categoryName'
        publish:
          - category_name: '${return_result[2:-2]}'
        navigate:
          - SUCCESS: get_product_ids
          - FAILURE: on_failure
    - get_product_ids:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${category_json}'
            - json_path: '$.*.products.*.productId'
        publish:
          - product_ids: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: iterate_products
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      get_category_name:
        x: 95
        'y': 378
      get_category:
        x: 88
        'y': 138
      get_product_ids:
        x: 289
        'y': 381
      iterate_products:
        x: 588
        'y': 388
        navigate:
          4a307125-e5b4-68d0-649a-f681c3ab2383:
            targetId: 3e3e4b9d-44b7-b602-53bb-c82cd4b1d585
            port: SUCCESS
    results:
      SUCCESS:
        3e3e4b9d-44b7-b602-53bb-c82cd4b1d585:
          x: 598
          'y': 153
