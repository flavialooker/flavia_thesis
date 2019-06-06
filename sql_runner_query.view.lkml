view: sql_runner_query {
  derived_table: {
    sql: SELECT
        listings.id  AS listings_id,
        reviews.comments  AS reviews_comments,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(listings.review_scores_rating ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(listings.id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(listings.id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(listings.id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(listings.id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS listings_sum_rating,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(listings.number_of_reviews ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(listings.id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(listings.id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(listings.id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(listings.id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS listings_sum_reviews_1
      FROM Flavia.listings  AS listings
      LEFT JOIN Flavia.reviews  AS reviews ON listings.id = reviews.listing_id

      WHERE
        ((reviews.comments IS NOT NULL AND LENGTH(reviews.comments ) <> 0 ) AND reviews.comments NOT LIKE '%The host canceled%' AND reviews.comments <> '.')
      GROUP BY 1,2
      ORDER BY 3 DESC,4 DESC
      LIMIT 100
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: listings_id {
    type: number
    sql: ${TABLE}.listings_id ;;
  order_by_field: listings_sum_rating
  }

  dimension: reviews_comments {
    type: string
    sql: ${TABLE}.reviews_comments ;;
  }

  dimension: listings_sum_rating {
    type: number
    sql: ${TABLE}.listings_sum_rating ;;
  }

  dimension: listings_sum_reviews_1 {
    type: number
    sql: ${TABLE}.listings_sum_reviews_1 ;;
  }

  set: detail {
    fields: [listings_id, reviews_comments, listings_sum_rating, listings_sum_reviews_1]
  }
}
