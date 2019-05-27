view: calendar {
  sql_table_name: Flavia.calendar ;;

  dimension: available {
    type: yesno
    sql: ${TABLE}.available ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year]
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
    drill_fields: [listings.id, listings.name, listings.host_name, date_date]
    sql: MAX(${date_date}) ;;
    convert_tz: no
  }

  measure: fist_data_date {
    type: date
    drill_fields: [listings.id, listings.name, listings.host_name, date_date]
    sql: MIN(${date_date}) ;;
    convert_tz: no
  }

  measure: count {
    type: count
    drill_fields: [listings.id, listings.name, listings.host_name]
  }
}
