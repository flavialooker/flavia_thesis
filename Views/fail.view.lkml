view: gambiarra_top_5 {
  derived_table: {
    sql: SELECT
          Distinct host_id,
          host_picture_url,
          host_name,
          host_listings_count
      FROM Flavia.listings  AS listings
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: host_id {
    type: number
    sql: ${TABLE}.host_id ;;
  }

  dimension: host_name {
    type: string
    sql: ${TABLE}.host_name ;;
  }

  dimension: host_picture_url {
    type: string
    sql: ${TABLE}.host_picture_url ;;
  }

  dimension: host_picture {
    type: string
    sql:${TABLE}.host_picture_url  ;;
    html: <img src="{{value}}" / style = "width:50%;height:50%"> ;;
  }

  dimension: host_listings_count {
    type: number
    sql: ${TABLE}.host_listings_count ;;
  }

  set: detail {
    fields: [host_id, host_picture_url, host_listings_count]
  }

  measure: total_host_listing {
    type: sum
    sql:  ${host_listings_count} ;;
  }

}
