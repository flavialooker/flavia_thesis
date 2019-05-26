connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

datagroup: flavia_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: flavia_thesis_default_datagroup

explore: calendar {
  join: listings {
    type: left_outer
    sql_on: ${calendar.listing_id} = ${listings.id} ;;
    relationship: one_to_one
  }
}

explore: listings {
  join:calendar {
    type: left_outer
    sql_on: ${listings.id} = ${calendar.listing_id} ;;
    relationship: one_to_one
  }
  join: reviews {
    type: left_outer
    sql_on: ${calendar.listing_id} = ${reviews.listing_id};;
    relationship: one_to_one
  }
}

explore: reviews {
  join: calendar {
    type: left_outer
    sql_on: ${reviews.listing_id} = ${calendar.listing_id} ;;
    relationship: one_to_one
  }
}
