view: gambiarradeucerto {
  label: "host_inf"
  derived_table: {
    sql: SELECT
          Distinct host_id,
          host_name,
          host_picture_url,
          host_listings_count,
          REGEXP_EXTRACT(host_picture_url, ".*jpg") as host_url
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

  dimension: host_listings_count {
    type: number
    sql: ${TABLE}.host_listings_count ;;
  }

  dimension: host_url {
    type: string
    sql: ${TABLE}.host_url ;;
  }

  dimension: host_picture {
    type: string
    sql:${TABLE}.host_picture_url  ;;
    html: <img src="{{value}}" / style = "width:100%;height:100%"> ;;
  }

  measure: total_host_listing {
    type: sum
    sql:  ${host_listings_count} ;;
    drill_fields: [host_name, listings.id, listings.price, listings.host_about, listings.host_started_year]
  }

  set: detail {
    fields: [host_name, listings.id, listings.price, listings.host_about, listings.host_started_year]
  }
}
