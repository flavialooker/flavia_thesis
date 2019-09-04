connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "/**/*.view"

map_layer: dublin_map {
  file: "/maps/map.topojson"
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
  always_filter: {
    filters: {
      field: listing_id
      value: "!=27063211"
    }
  }
  join: listings {
    type: left_outer
    sql_on: ${calendar.listing_id} = ${listings.id} ;;
    relationship: many_to_one
  }
  join: daft {
    type: full_outer
    sql_on: ${calendar.calendar_quarter} = ${daft.quarter} ;;
    relationship: many_to_many
  }
}

explore: listings {
  always_filter: {
    filters: {
      field: neighbourhood
      value: "-Docklands"
    }
  }
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

explore: airbnb_room_type_avg_rental {
  join: daft {
    type: full_outer
    sql_on: ${airbnb_room_type_avg_rental.calendar_calendar_quarter} = ${daft.quarter} ;;
    relationship: many_to_many
  }
}

explore: gambiarradeucerto {
  join: listings {
    type: left_outer
    sql_on: ${gambiarradeucerto.host_id} = ${listings.host_id} ;;
    relationship: many_to_many
  }
}

# explore: daft {}
#
# explore: videos_br {}
#
# explore: lookml_liquids_dt {}
