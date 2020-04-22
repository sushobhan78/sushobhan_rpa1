namespace: AOS2.product.sub-flows
flow:
  name: iterate_products
  inputs:
    - json
    - category_name
    - category_id
    - product_id
    - file_path
  workflow:
    - get_product_name:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: "${'$.*.products[?(@.productId == '+product_id+')].productName'}"
        publish:
          - product_name: '${return_result[2:-2]}'
        navigate:
          - SUCCESS: get_product_price
          - FAILURE: on_failure
    - get_product_price:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: "${'$.*.products[?(@.productId == '+product_id+')].price'}"
        publish:
          - product_price: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: get_color_codes
          - FAILURE: on_failure
    - get_color_codes:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: "${'$.*.products[?(@.productId == '+product_id+')].colors.*.code'}"
        publish:
          - color_codes: "${filter(lambda ch: ch not in '\"', return_result)[1:-1]}"
        navigate:
          - SUCCESS: is_excel
          - FAILURE: on_failure
    - add_product:
        do:
          io.cloudslang.base.filesystem.add_text_to_file:
            - file_path: '${file_path}'
            - text: "${\"|\"+\"|\".join([category_id.rjust(13),category_name.ljust(15),product_id.rjust(12),product_name.ljust(51),product_price.rjust(15),color_codes.ljust(60)])+\"|\\n\"}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - is_excel:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: '${str(file_path.endswith("xls") or file_path.endswith("xlsx"))}'
        navigate:
          - 'TRUE': Add_Excel_Data
          - 'FALSE': add_product
    - Add_Excel_Data:
        do_external:
          4552e495-4595-4916-b58b-ce521bdb1e9a:
            - excelFileName: '${file_path}'
            - worksheetName: products
            - headerData: "${'Category ID,Category Name,Product ID,Product Name,Product Price,'+','.join(['Color Code'] * 8)}"
            - rowData: "${category_id+','+category_name+','+product_id+','+product_name+','+product_price+','+color_codes}"
            - columnDelimiter: ','
            - rowsDelimiter: '|'
            - overwriteData: 'false'
        navigate:
          - failure: on_failure
          - success: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      get_product_price:
        x: 118
        'y': 351
      get_product_name:
        x: 113
        'y': 168
      get_color_codes:
        x: 311
        'y': 358
      add_product:
        x: 605
        'y': 383
        navigate:
          bd3b606b-58f9-1b18-ca6f-6fe99c12768f:
            targetId: 28039335-e33c-3b34-4247-584a8e6267c9
            port: SUCCESS
      is_excel:
        x: 468
        'y': 208
      Add_Excel_Data:
        x: 592
        'y': 61
        navigate:
          fe88c67b-6602-fc05-1054-aa172003fe6d:
            targetId: 28039335-e33c-3b34-4247-584a8e6267c9
            port: success
    results:
      SUCCESS:
        28039335-e33c-3b34-4247-584a8e6267c9:
          x: 725
          'y': 219
