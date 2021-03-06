view: airbnb_room_type_avg_rental {
  derived_table: {
    sql: SELECT
        listings.room_type  AS listings_room_type,
        FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP_TRUNC(CAST(CAST(calendar.date  AS TIMESTAMP) AS TIMESTAMP), QUARTER)) AS calendar_calendar_quarter,
        CAST(TIMESTAMP(calendar.date)  AS DATE) AS calendar_calendar_date,
        COALESCE(SUM(calendar.price ), 0) AS calendar_sum_rental,
        AVG(calendar.price ) AS calendar_average_rental
      FROM Flavia.calendar  AS calendar
      LEFT JOIN Flavia.listings  AS listings ON calendar.listing_id = listings.id

      WHERE
        NOT (calendar.listing_id  = 27063211)
      GROUP BY 1,2,3
      ORDER BY 1 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: listings_room_type {
    type: string
    sql: ${TABLE}.listings_room_type ;;
  }

  dimension: calendar_calendar_quarter {
    type: string
    sql: ${TABLE}.calendar_calendar_quarter ;;
  }

  dimension: calendar_sum_rental {
    type: number
    sql: ${TABLE}.calendar_sum_rental ;;
    value_format_name: eur_0
  }

  dimension: calendar_average_rental {
    type: number
    sql: ${TABLE}.calendar_average_rental ;;
    value_format_name: eur_0
  }


  set: detail {
    fields: [listings_room_type, calendar_calendar_quarter, calendar_sum_rental, calendar_average_rental]
  }
}
