view: listings {
  sql_table_name: Flavia.listings ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: access {
    type: string
    sql: ${TABLE}.access ;;
  }

  dimension: accommodates {
    type: number
    sql: ${TABLE}.accommodates ;;
  }

  dimension: amenities {
    type: string
    sql: ${TABLE}.amenities ;;
  }

  dimension: availability_30 {
    type: number
    sql: ${TABLE}.availability_30 ;;
  }

  dimension: availability_365 {
    type: number
    sql: ${TABLE}.availability_365 ;;
  }

  dimension: availability_60 {
    type: number
    sql: ${TABLE}.availability_60 ;;
  }

  dimension: availability_90 {
    type: number
    sql: ${TABLE}.availability_90 ;;
  }

  dimension: bathrooms {
    type: number
    sql: ${TABLE}.bathrooms ;;
  }

  dimension: bed_type {
    type: string
    sql: ${TABLE}.bed_type ;;
  }

  dimension: bedrooms {
    type: number
    sql: ${TABLE}.bedrooms ;;
  }

  dimension: beds {
    type: number
    sql: ${TABLE}.beds ;;
  }

  dimension: calculated_host_listings_count {
    type: number
    sql: ${TABLE}.calculated_host_listings_count ;;
  }

  dimension_group: calendar_last_scraped {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_last_scraped ;;
  }

  dimension: calendar_updated {
    type: string
    sql: ${TABLE}.calendar_updated ;;
  }

  dimension: cancellation_policy {
    type: string
    sql: ${TABLE}.cancellation_policy ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cleaning_fee {
    type: number
    sql: ${TABLE}.cleaning_fee ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: experiences_offered {
    type: string
    sql: ${TABLE}.experiences_offered ;;
  }

  dimension: extra_people {
    type: number
    sql: ${TABLE}.extra_people ;;
  }

  dimension_group: first_review {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_review ;;
  }

  dimension: guests_included {
    type: number
    sql: ${TABLE}.guests_included ;;
  }

  dimension: has_availability {
    type: yesno
    sql: ${TABLE}.has_availability ;;
  }

  dimension: host_about {
    type: string
    sql: ${TABLE}.host_about ;;
  }

  dimension: host_acceptance_rate {
    type: string
    sql: ${TABLE}.host_acceptance_rate ;;
  }

  dimension: host_has_profile_pic {
    type: yesno
    sql: ${TABLE}.host_has_profile_pic ;;
  }

  dimension: host_id {
    type: number
    sql: ${TABLE}.host_id ;;
  }

  dimension: host_identity_verified {
    type: yesno
    sql: ${TABLE}.host_identity_verified ;;
  }

  dimension: host_is_superhost {
    type: yesno
    sql: ${TABLE}.host_is_superhost ;;
  }

  dimension: host_listings_count {
    type: number
    sql: ${TABLE}.host_listings_count ;;
  }

  dimension: host_location {
    type: string
    sql: ${TABLE}.host_location ;;
  }

  dimension: host_name {
    type: string
    sql: ${TABLE}.host_name ;;
  }

  dimension: host_neighbourhood {
    type: string
    sql: ${TABLE}.host_neighbourhood ;;
  }

  dimension: host_picture_url {
    type: string
    sql: ${TABLE}.host_picture_url ;;
  }

  dimension: host_response_rate {
    type: string
    sql: ${TABLE}.host_response_rate ;;
  }

  dimension: host_response_time {
    type: string
    sql: ${TABLE}.host_response_time ;;
  }

  dimension_group: host_since {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.host_since ;;
  }

  dimension: host_thumbnail_url {
    type: string
    sql: ${TABLE}.host_thumbnail_url ;;
  }

  dimension: host_total_listings_count {
    type: number
    sql: ${TABLE}.host_total_listings_count ;;
  }

  dimension: host_url {
    type: string
    sql: ${TABLE}.host_url ;;
  }

  dimension: host_verifications {
    type: string
    sql: ${TABLE}.host_verifications ;;
  }

  dimension: house_rules {
    type: string
    sql: ${TABLE}.house_rules ;;
  }

  dimension: instant_bookable {
    type: yesno
    sql: ${TABLE}.instant_bookable ;;
  }

  dimension: interaction {
    type: string
    sql: ${TABLE}.interaction ;;
  }

  dimension: is_business_travel_ready {
    type: yesno
    sql: ${TABLE}.is_business_travel_ready ;;
  }

  dimension: is_location_exact {
    type: yesno
    sql: ${TABLE}.is_location_exact ;;
  }

  dimension: jurisdiction_names {
    type: string
    sql: ${TABLE}.jurisdiction_names ;;
  }

  dimension_group: last_review {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_review ;;
  }

  dimension_group: last_scraped {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_scraped ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: license {
    type: string
    sql: ${TABLE}.license ;;
  }

  dimension: listing_url {
    type: string
    sql: ${TABLE}.listing_url ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: maximum_nights {
    type: number
    sql: ${TABLE}.maximum_nights ;;
  }

  dimension: medium_url {
    type: string
    sql: ${TABLE}.medium_url ;;
  }

  dimension: minimum_nights {
    type: number
    sql: ${TABLE}.minimum_nights ;;
  }

  dimension: monthly_price {
    type: number
    sql: ${TABLE}.monthly_price ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: neighborhood_overview {
    type: string
    sql: ${TABLE}.neighborhood_overview ;;
  }

  dimension: neighbourhood {
    type: string
    sql: ${TABLE}.neighbourhood ;;
  }

  dimension: neighbourhood_cleansed {
    type: string
    sql: ${TABLE}.neighbourhood_cleansed ;;
  }

  dimension: neighbourhood_group_cleansed {
    type: string
    sql: ${TABLE}.neighbourhood_group_cleansed ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: number_of_reviews {
    type: number
    sql: ${TABLE}.number_of_reviews ;;
  }

  dimension: picture_url {
    type: string
    sql: ${TABLE}.picture_url ;;
  }

  dimension: property_type {
    type: string
    sql: ${TABLE}.property_type ;;
  }

  dimension: require_guest_phone_verification {
    type: yesno
    sql: ${TABLE}.require_guest_phone_verification ;;
  }

  dimension: require_guest_profile_picture {
    type: yesno
    sql: ${TABLE}.require_guest_profile_picture ;;
  }

  dimension: requires_license {
    type: yesno
    sql: ${TABLE}.requires_license ;;
  }

  dimension: review_scores_accuracy {
    type: number
    sql: ${TABLE}.review_scores_accuracy ;;
  }

  dimension: review_scores_checkin {
    type: number
    sql: ${TABLE}.review_scores_checkin ;;
  }

  dimension: review_scores_cleanliness {
    type: number
    sql: ${TABLE}.review_scores_cleanliness ;;
  }

  dimension: review_scores_communication {
    type: number
    sql: ${TABLE}.review_scores_communication ;;
  }

  dimension: review_scores_location {
    type: number
    sql: ${TABLE}.review_scores_location ;;
  }

  dimension: review_scores_rating {
    type: number
    sql: ${TABLE}.review_scores_rating ;;
  }

  dimension: review_scores_value {
    type: number
    sql: ${TABLE}.review_scores_value ;;
  }

  dimension: reviews_per_month {
    type: number
    sql: ${TABLE}.reviews_per_month ;;
  }

  dimension: room_type {
    type: string
    sql: ${TABLE}.room_type ;;
  }

  dimension: scrape_id {
    type: number
    sql: ${TABLE}.scrape_id ;;
  }

  dimension: security_deposit {
    type: number
    sql: ${TABLE}.security_deposit ;;
  }

  dimension: smart_location {
    type: string
    sql: ${TABLE}.smart_location ;;
  }

  dimension: space {
    type: string
    sql: ${TABLE}.space ;;
  }

  dimension: square_feet {
    type: number
    sql: ${TABLE}.square_feet ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: thumbnail_url {
    type: string
    sql: ${TABLE}.thumbnail_url ;;
  }

  dimension: transit {
    type: string
    sql: ${TABLE}.transit ;;
  }

  dimension: weekly_price {
    type: number
    sql: ${TABLE}.weekly_price ;;
  }

  dimension: xl_picture_url {
    type: string
    sql: ${TABLE}.xl_picture_url ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  measure: first_quartile {
    type: percentile
    percentile: 25
    sql: ${price} ;;
  }
  measure: third_quartile {
    type: percentile
    percentile: 75
    sql: ${price} ;;
  }

  measure: second_quartile {
    type: percentile
    percentile: 50
    sql: ${price} ;;
  }

  measure: min {
    type: min
    sql: ${price} ;;
  }

  measure: max {
    type: max
    sql: ${price} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, host_name, calendar.count, reviews.count]
  }
}
