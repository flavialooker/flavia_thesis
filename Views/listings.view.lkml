view: listings {
  sql_table_name: Flavia.listings ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: Daft_listing_count {
    label: "Daft Listings Dublin"
    type: string
    sql: "2200" ;;
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
    sql: ${TABLE}.availability_365;;
    }


  dimension: availability_60 {
    type: number
    sql: ${TABLE}.availability_60 ;;
  }

  dimension: availability_90 {
    type: number
    value_format: "0.#####"
    sql: ${TABLE}.availability_90 * 1.11111102634;;
#     html: {{ rendered_value }} ;;


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
    description: "Not sure about this dimension"
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
    case: {
      when: {
        sql: ${TABLE}.city LIKE "Dublin%" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Arbour Hill" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Ashtown" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Artane" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Ballsbridge" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Ballymun" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Beaumont" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Cabra" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city ="Churchtown" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Clontarf" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Donnybrook" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Drimnagh" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Drumcondra" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Fairview" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city LIKE "Finglas%" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Glasnevin" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Harold's Cross" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Irishtown" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Kilmainham" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Kimmage" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Marino" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "North Strand" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Phibsborough" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Raheny" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Ranelagh" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Rathfarnham" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Rathgar" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Rathmines" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city LIKE "Ri%" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Sandymount" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Santry" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Terenure" ;;
        label: "Dublin"
      }
      when: {
        sql: ${TABLE}.city = "Whitehall" ;;
        label: "Dublin"
      }
      else: "Outside Dublin"
    }
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

  dimension_group: duration_test {
    type: duration
    intervals: [day,hour]
    datatype: date
    sql_start: ${first_review_raw} ;;
    sql_end: ${host_started_raw} ;;
  }

  dimension: guests_included {
    hidden: yes
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
    hidden: yes
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


#   dimension: host_url_teste {
#     type: string
#     sql: ${TABLE}.host_url ;;
#     link: {
#       label: "Airbnb"
#       url: "{{value}}"
#       icon_url: "https://www.airbnb.com/favicon.ico"
#     }
#   }


  dimension: host_neighbourhood {
    type: string
    sql: ${TABLE}.host_neighbourhood ;;
  }

  dimension: host_picture_url {
    type: string
    sql: ${TABLE}.host_picture_url ;;
  }

  dimension: host_picture {
    type: string
    sql: 1 ;;
    html: <img src="{{host_picture_url._value}}"/> ;;
  }

  dimension: host_response_rate {
    type: string
    sql: ${TABLE}.host_response_rate ;;
  }

  dimension: host_response_time {
    type: string
    sql: ${TABLE}.host_response_time ;;
  }

  dimension_group: host_started{
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
    hidden: yes
    type: string
    sql: ${TABLE}.host_thumbnail_url ;;
  }

  dimension: host_total_listings_count {
    description: "Count of listing per profile despite located in Dublin"
    type: number
    sql: ${TABLE}.host_total_listings_count ;;
  }

  dimension: host_url {
    type: string
    sql: ${TABLE}.host_url ;;
  }

#   dimension: host_url_teste {
#     type: string
#     sql: ${TABLE}.host_url ;;
#     link: {
#       label: "Airbnb"
#       url: "{{value}}"
#       icon_url: "https://www.airbnb.com/favicon.ico"
#     }
#   }
#
#   dimension: host_url_test2 {
#     type: string
#     sql: ${TABLE}.host_url ;;
#     html:<a href="{{ value }}">{{ value }}</a> ;;
#   }

  dimension: host_url_test3 {
    label: "Host Profile"
    type: string
    sql: ${TABLE}.host_url ;;
    html:<a href="{{ value }}">Link</a> ;;
  }

#   dimension: host_url_link {
#     label: "Host Profile"
#     type: string
#     sql: ${TABLE}.host_url ;;
#     html:<a href="{{ value }}">URL</a> ;;
#   }


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
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_business_travel_ready ;;
  }

  dimension: is_location_exact {
    type: yesno
    sql: ${TABLE}.is_location_exact ;;
  }

  dimension: jurisdiction_names {
    hidden: yes
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
    hidden: yes
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

dimension: listings_location {
  type: location
  sql_latitude: ${latitude} ;;
  sql_longitude: ${longitude} ;;
}

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: license {
    hidden: yes
    type: string
    sql: ${TABLE}.license ;;
  }

  dimension: listing_url {
    type: string
    sql: ${TABLE}.listing_url ;;
  }

  dimension: listing_airbnb_link{
    label: "Airbnb URL"
     type: string
    sql: ${TABLE}.listing_url ;;
    link: {
      label: "Airbnb"
      url: "{{value}}"
      icon_url: "https://www.airbnb.com/favicon.ico"
    }
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
    hidden: yes
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
    link: {
      label: "{{value}} Region Drill"
      url: "/dashboards/399?Neighbourhood={{ value }}&Superhost={{ listings.host_is_superhost }}&Date={{ _filters['calendar.calendar_date'] | url_encode }}"
    }

    link: {
      label: "Drill Explore"
      url: "/explore/flavia_thesis/listings?fields=listings.host_name,listings.neighbourhood,listings.average_price&f[listings.neighbourhood]={{ value | url_encode }}&f[calendar.calendar_date]={{ _filters['calendar.calendar_date'] }}&f[listings.host_is_superhost]={{ listings.host_is_superhost }}"
  }
  }

#   or url: "/explore/flavia_thesis/listings?fields=listings.host_name,listings.neighbourhood,listings.average_price&f[listings.neighbourhood]={{ value | url_encode }}&f[calendar.calendar_date]={{ _filters['calendar.calendar_date'] }}&f[listings.host_is_superhost]=Yes"

#       link: {
#         label:"{{value}} Region Drill"
#         url:"/looks/1365?&f[listings.neighbourhood]={{ value }}"
#       }
#     }


  parameter: max_rank {
    type: number
  }

  dimension: rank_limit {
    type: number
    sql: {% parameter max_rank %} ;;
  }

  dimension: neighbourhood_cleansed {
    hidden: yes
    type: string
    sql: ${TABLE}.neighbourhood_cleansed ;;
  }

  dimension: neighbourhood_group_cleansed {
  hidden: yes
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
    hidden: yes
    type: yesno
    sql: ${TABLE}.require_guest_profile_picture ;;
  }

  dimension: requires_license {
    hidden: yes
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
    drill_fields: [review_scores_accuracy]
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
    hidden: yes
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
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.xl_picture_url ;;
  }

  dimension: zipcode {
    hidden: yes
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format: "0\"€\""
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

#   measure: count {
#     type: count
#     drill_fields: [id, name, host_name, neighbourhood, calendar.count, reviews.count]
#   }

  measure: listings_count{
    type: count_distinct
    # filters:{
    # field: neighbourhood
    # value: "Drumcondra"
    # }
    drill_fields: [id,host_name, neighbourhood, beds,host_started_date,price]
    sql: ${id} ;;
  # html: <p style=“color: grey; font-family: OpenSans; background-color:white; text-align:centre; font-size: 50%“>Coverage Rate </p> {{ rendered_value }} ;;
}
  measure: average_price {
    type: average
    sql: ${price} ;;
    value_format_name: eur
    drill_fields: [id,host_name, neighbourhood, amenities, beds,average_price,price]
  }

  measure: average_weekly_price {
#     group this under average
    type: average
    sql: ${weekly_price} ;;
    value_format_name: eur
    drill_fields: [id,host_name, neighbourhood, amenities, beds, average_weekly_price, weekly_price]
  }

  measure: average_monthly_price {
    type: average
    sql: ${monthly_price} ;;
    value_format_name: eur
    drill_fields: [id,host_name, neighbourhood, amenities, beds,listings.average_monthly_price, monthly_price]
  }

  measure: Sum_reviews {
    type: sum
    sql: ${number_of_reviews} ;;
    drill_fields: [host_name, host_picture, host_started_year, description, room_type, neighbourhood, review_scores_rating, listing_airbnb_link]
  }
  measure: total_reviews_per_month {
    type: sum
    sql: ${reviews_per_month} ;;
    drill_fields:[id, host_name, reviews_per_month, review_scores_rating, reviews.comments,]
  }
measure: sum_price {
  type: sum
  sql: ${price} ;;
}

measure: sum_total_host_listing {
  type: sum_distinct
  sql:  ${TABLE}.host_total_listings_count ;;

}
measure: sum_rating {
  type: sum
  sql: ${review_scores_rating} ;;
}

dimension: drill_look_test {
 type: string
sql: ${TABLE}.space ;;
    html:
    {% if street._in_query %}
    <a href= "https://productday.dev.looker.com/looks/298">{{value}}</a>
      {% elsif city._in_query %}
      <a href= "https://productday.dev.looker.com/looks/696">{{value}}</a>
      {% else %}
        {{value}}}
      {% endif %}
;;
  }
}
