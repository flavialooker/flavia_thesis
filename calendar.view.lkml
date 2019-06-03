view: calendar {
  sql_table_name: Flavia.calendar ;;

  dimension: available {
    type: yesno
    sql: ${TABLE}.available ;;
  }

  dimension_group: calendar {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      day_of_week,
      day_of_week_index,
      year]
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: listing_id {
    primary_key: yes
    type: number
    # hidden: yes
    sql: ${TABLE}.listing_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  measure: last_update_date {
    type: date
    drill_fields: [listings.id, listings.name, listings.host_name, calendar_date]
    sql: MAX(${calendar_date}) ;;
    convert_tz: no
  }

  measure: fist_data_date {
    type: date
    drill_fields: [listings.id, listings.name, listings.host_name, calendar_date  ]
    sql: MIN(${calendar_date}) ;;
    convert_tz: no
  }

  measure: available_listings {
    type: count_distinct
    sql: ${listing_id} ;;
    filters: {
      field: available
      value: "yes"
    }
  }

  measure: count {
    type: count
    drill_fields: [listings.id, listings.name, listings.host_name]
  }
}
