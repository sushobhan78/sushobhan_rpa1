namespace: AOS2.product
flow:
  name: get_products
  inputs:
    - aos_url: 'http://localhost:8080'
    - file_path: "c:\\\\temp\\\\products.xlsx"
  workflow:
    - http_client_get:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: '${aos_url+"/catalog/api/v1/categories/all_data"}'
        publish:
          - json: '${return_result}'
        navigate:
          - SUCCESS: is_excel
          - FAILURE: on_failure
    - write_header:
        do:
          io.cloudslang.base.filesystem.write_to_file:
            - file_path: '${file_path}'
            - text: "${'+'+'+'.join([''.center(13,'-'),''.center(15,'-'),''.center(12,'-'),''.center(51,'-'),''.center(15,'-'),''.center(60,'-')])+'+\\n'+\\\n'|'+'|'.join(['Category ID'.center(13),'Category Name'.center(15),'Product ID'.center(12),'Product Name'.center(51),'Product Price'.center(15),'Color Codes'.center(60)])+'|\\n'+\\\n'+'+'+'.join([''.center(13,'-'),''.center(15,'-'),''.center(12,'-'),''.center(51,'-'),''.center(15,'-'),''.center(60,'-')])+'+\\n'}"
        navigate:
          - SUCCESS: get_categories
          - FAILURE: on_failure
    - get_categories:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: '$.*.categoryId'
        publish:
          - category_id_list: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: iterate_categories
          - FAILURE: on_failure
    - iterate_categories:
        loop:
          for: category_id in category_id_list
          do:
            AOS2.product.sub-flows.iterate_categories:
              - json: '${json}'
              - category_id: '${category_id}'
              - file_path: '${file_path}'
          break: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - is_excel:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: '${str(file_path.endswith("xls") or file_path.endswith("xlsx"))}'
        navigate:
          - 'TRUE': delete
          - 'FALSE': write_header
    - delete:
        do:
          io.cloudslang.base.filesystem.delete:
            - source: '${file_path}'
        navigate:
          - SUCCESS: New_Excel_Document
          - FAILURE: New_Excel_Document
    - New_Excel_Document:
        do_external:
          9d21ca68-7d03-4fb3-9478-03956532bf6f:
            - excelFileName: '${file_path}'
            - worksheetNames: products
            - delimiter: ;
        publish:
          - returnResult
        navigate:
          - failure: on_failure
          - success: get_categories
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      http_client_get:
        x: 7
        'y': 213
      write_header:
        x: 284
        'y': 395
      get_categories:
        x: 418
        'y': 209
      iterate_categories:
        x: 567
        'y': 208
        navigate:
          3613553b-9b69-a8bd-9b26-d532fc1210f0:
            targetId: b9b28a60-c50f-aebe-61b5-a89bfc73d595
            port: SUCCESS
      is_excel:
        x: 142
        'y': 214
      delete:
        x: 218
        'y': 64
      New_Excel_Document:
        x: 358
        'y': 67
    results:
      SUCCESS:
        b9b28a60-c50f-aebe-61b5-a89bfc73d595:
          x: 715
          'y': 211
