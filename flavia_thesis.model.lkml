connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"


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
    sql_on: ${listings.id} = ${reviews.listing_id} ;;
    relationship: one_to_one
  }
}

explore: reviews {
  join: calendar {
    type: left_outer
    sql_on: ${reviews.listing_id} = ${calendar.listing_id} ;;
    relationship: one_to_one
  }

join: listings {
  type: left_outer
  sql_on: ${reviews.listing_id} = ${listings.id} ;;
  relationship: one_to_one
}
}
