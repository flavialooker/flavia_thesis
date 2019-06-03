view: reviews {
  sql_table_name: Flavia.reviews ;;

  dimension: id {
#     primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: listing_id {
    primary_key: yes
    type: number
    # hidden: yes
    sql: ${TABLE}.listing_id ;;
  }

  dimension: reviewer_id {
    type: number
    sql: ${TABLE}.reviewer_id ;;
  }

  dimension: reviewer_name {
    type: string
    sql: ${TABLE}.reviewer_name ;;
  }

  dimension: number_of_reviews  {
    hidden: yes
    type: number
    sql: ${listings.number_of_reviews} ;;
  }

  measure: Sum_reviews {
    type: sum
    sql: ${number_of_reviews} ;;
   }

  measure: count {
    type: count
    drill_fields: [id, reviewer_name, listings.id, listings.name, listings.host_name]
  }
}
