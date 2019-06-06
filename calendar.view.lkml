view: calendar {
  sql_table_name: Flavia.calendar ;;

  dimension: available {
    type: yesno
    sql: ${TABLE}.available ;;
  }
dimension: id {
  primary_key: yes
  type: string
  sql: GENERATE_UUID() ;;
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
  measure: sum_rental {
    type: sum
    sql: ${price} ;;
    value_format_name: eur_0
  }

  measure: count {
    type: count
    drill_fields: [listings.id, listings.name, listings.host_name]
  }
}
