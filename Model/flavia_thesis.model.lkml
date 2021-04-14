connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "/**/*.view"
include: "/dashboards/*.dashboard.lookml"

label: "Bank Consumers Test"


access_grant: filter_field_only_test {
  user_attribute: testy
  allowed_values: [ "test" ]
}

map_layer: dublin_map {
  file: "/maps/map.topojson"
}

map_layer: canadian_provinces {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.oh_canada/{z}/{x}/{y}.mvt?access_token=@{mapbox_api_key}"
  feature_key: "provinces"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/c98a443cfd7dc93191a3f3f6c54059b9a35a9134/canada_provinces.json"
  min_zoom_level: 2
  max_zoom_level: 10
  property_key: "PRENAME"
}

map_layer: uk_postal_districts {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.63tiis35/{z}/{x}/{y}.mvt?access_token=@{mapbox_api_key}"
  feature_key: "PostalDistrict-5b1t0d"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/6b7c7cff6d193189cca4f73b314f558e8ee58f85/uk_postal_districts.json"
  min_zoom_level: 8
  max_zoom_level: 13
  property_key: "PostDist"
}


explore: dublin_regions {
  label: "Account Sctructure"
  join: listings {
    type: left_outer
    sql_on: ${dublin_regions.id}=${listings.id} ;;
    relationship: one_to_one
  }
  join: calendar {
    type: left_outer
    sql_on: ${dublin_regions.id}= ${calendar.listing_id} ;;
    relationship: one_to_one
  }
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
  join: calendar {
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

  join: calendar {
    type: left_outer
    sql_on: ${calendar.id}=  ${gambiarradeucerto.host_id} ;;
    relationship: many_to_many
  }
}
explore: lookml_generated_dt {}

explore: concact_test {}

explore: daft {}

explore: videos_br {}

explore: lookml_liquids_dt {}
