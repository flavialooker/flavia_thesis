connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

map_layer: dublin_map {
  file: "map.topojson"
}
explore: dublin_regions {
  join: listings {
    type: left_outer
    sql_on: ${dublin_regions.id}=${listings.id} ;;
    relationship: one_to_one
  }
#   join: calendar {
#     type: left_outer
#     sql_on: ${dublin_regions.id}= ${calendar.listing_id} ;;
#     relationship: one_to_one
#   }
  join: reviews {
    type: left_outer
    sql_on: ${dublin_regions.id} = ${reviews.listing_id} ;;
    relationship: one_to_many
  }
}

explore: calendar {
  join: listings {
    type: left_outer
    sql_on: ${calendar.listing_id} = ${listings.id} ;;
    relationship: many_to_one
  }
}

explore: listings {
  join:calendar {
    type: left_outer
    sql_on: ${listings.id} = ${calendar.listing_id} ;;
    relationship: one_to_many
  }
  join: reviews {
    type: left_outer
    sql_on: ${listings.id} = ${reviews.listing_id} ;;
    relationship: one_to_many
  }
  join: dublin_regions {
    type: left_outer
    sql_on: ${listings.id} = ${dublin_regions.id} ;;
    relationship: one_to_one
  }
}

explore: reviews {
  join: calendar {
    type: left_outer
    sql_on: ${reviews.listing_id} = ${calendar.listing_id} ;;
    relationship: many_to_many
  }

join: listings {
  type: left_outer
  sql_on: ${reviews.listing_id} = ${listings.id} ;;
  relationship: many_to_one
 }
}
