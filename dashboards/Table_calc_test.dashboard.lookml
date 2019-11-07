- dashboard: table_calc_test
  title: Table Calc test
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: flavia_thesis
    explore: listings
    type: looker_grid
    fields: [listings.host_id, listings.availability_30, listings.listings_count,
      listings.Sum_reviews, listings.average_price]
    filters:
      listings.neighbourhood: "-Docklands"
    sorts: [listings.listings_count desc]
    limit: 10
    dynamic_fields: [{table_calculation: ar1, label: AR1, expression: "${listings.listings_count}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar2, label: AR2, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar3, label: AR3, expression: "${listings.average_price}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar4, label: AR4, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar5, label: AR5, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar6, label: AR6, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar7, label: AR7, expression: "${listings.availability_30}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar8, label: AR8, expression: "${listings.availability_30}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar9, label: AR9, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar10, label: AR10, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar11, label: AR11, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar12, label: AR12, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar13, label: AR13, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar14, label: AR14, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar15, label: AR15, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar16, label: AR16, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar17, label: AR17, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar18, label: AR18, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar19, label: AR19, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: ar20, label: AR20, expression: "${listings.Sum_reviews}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure}]
    query_timezone: America/Los_Angeles
    column_order: ["$$$_row_numbers_$$$", ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, ar13, ar14, ar15, ar16, ar17, ar18, ar19, ar20]
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [listings.average_price, listings.Sum_reviews, listings.listings_count,
      listings.availability_30, listings.host_id]
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 7
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
