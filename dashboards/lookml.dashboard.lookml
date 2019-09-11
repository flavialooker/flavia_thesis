- dashboard: lookml_dahsboard_test
  title: Lookml dahsboard test
  layout: newspaper
  elements:
  - title: lookml dash test
    name: lookml dash test
    model: flavia_thesis
    explore: listings
    type: table
    fields: [dublin_regions.neighbourhood, listings.average_price, calendar.calendar_month]
    pivots: [dublin_regions.neighbourhood]
    fill_fields: [calendar.calendar_month]
    filters:
      listings.neighbourhood: "-Docklands"
      calendar.calendar_month: 6 months
    sorts: [listings.average_price desc 0, dublin_regions.neighbourhood]
    limit: 10
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    series_types: {}
    row: 0
    col: 0
    width: 24
    height: 7
