view: concact_test {
  derived_table: {
    sql: SELECT
        listings.property_type  AS listings_property_type,
        COALESCE(SUM(listings.price ), 0) AS listings_sum_price,
        CONCAT(listings.property_type, '-', ' ', CAST((COALESCE(SUM(listings.price ), 0)) AS STRING))  AS listings_concat_test
      FROM Flavia.listings  AS listings

      WHERE
        (listings.neighbourhood <> 'Docklands' OR listings.neighbourhood IS NULL)
      GROUP BY 1
      ORDER BY 3 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: listings_property_type {
    type: string
    sql: ${TABLE}.listings_property_type ;;
  }

  measure: listings_sum_price {
    type: sum
    sql: ${TABLE}.listings_sum_price ;;
  }

  dimension: listings_concat_test {
    type: string
    sql: ${TABLE}.listings_concat_test ;;
  }

  set: detail {
    fields: [listings_property_type, listings_sum_price, listings_concat_test]
  }
}
