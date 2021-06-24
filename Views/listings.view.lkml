view:listings {
  sql_table_name: Flavia.listings ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: hard_code_test{
    type: string
    sql: case when 1=1 then "Learn more about your visitors" else null end ;;
    html: <a href= "https://productday.dev.looker.com/looks/298">{{value}}</a> ;;
  }

  # dimension: hard_code_test_2{
  #   sql: Learn more about your visitors ;;
  #   html: <a href= "https://productday.dev.looker.com/looks/298">{{value}}</a> ;;
  # }

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
    sql: ${TABLE}.bed_type;;
    required_access_grants: [filter_field_only_test ]
  }


parameter: dimension_suggestions {
    type: string
    suggest_dimension: listings.bed_type
    required_access_grants: [filter_field_only_test ]

  }

  dimension: filterd_value_test {
    type: string
    sql: {% if dimension_suggestions._parameter_value  == "'Real Bed'" %}
      ${bed_type}
    {% elsif dimension_suggestions._parameter_value  == "'Couch'" %}
    ${bedrooms}
    {% else  %}
    null
    {% endif %} ;;
    }
  #sql: ${bed_type} ;;
#  html:{% if _filters['listings.bed_type'] == "Real Bed" %}
#     {{rendered_value}}
#     {% elsif _filters['listings.bed_type'] == "Couch" %}
#     {{ listings.bedrooms._value }}
#     {% else %}
#     {{ listings.bathrooms._value }}
#     {% endif %};;
#   }









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

#   dimension: html_quarter {
#     type: string
#     sql: ${calendar_last_scraped_quarter} ;;
#     html: {% if value == "'2018-Q3'" %}
#         Q3
#    {% endif %};;
#   }

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


  dimension: is_first_review_in_the_past_90days {
    type: yesno
    sql: DATE_DIFF(listings.first_review, CURRENT_DATE(), DAY) < 90 ;;
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
  required_access_grants: [filter_field_only_test ]
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
    map_layer_name: uk_postal_districts
  }

  dimension: english_province_name {
    type: string
    map_layer_name: canadian_provinces
  }

  dimension: test_split_liquid {
    sql:${host_location} ;;
    html: {% if host_location._value contains 'United States' %}
    United States
    {% elsif host_location._value contains 'Germany' %}
    Germany
    {% endif %} ;;

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
    html:
    {% if listings.monthly_price._is_filtered %}
    <font color="darkgreen">{{value}}</font>
    {% else %}
    {{value}}
    {% endif %};;
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
    html: <a href="/dashboards/399?Date_test={{ _filters['calendar.calendar_date'] }}"> {{value}} </a>;;

      # link: {
      #   label: "{{value}} Region Drill"
      # #drill to embed dashboard to remove filters
      # url: "/embed/dashboards/399?Neighbourhood={{ filterable_value | url_encode }}&Superhost={{ listings.host_is_superhost }}&Date={{ _filters['calendar.calendar_date'] }}"
      # }

       #drill to regular dashboard example

      #   url: "/dashboards/399?Neighbourhood={{ filterable_value | url_encode }}&Superhost={{ listings.host_is_superhost }}&Date={{ _filters['calendar.calendar_date'] }}"
      # }




#      link: {
#        label: "Drill Explore"
#        url: "/explore/flavia_thesis/listings?fields=listings.host_name,listings.neighbourhood,listings.average_price&f[listings.neighbourhood]={{ value | url_encode }}&f[calendar.calendar_date]={{ _filters['calendar.calendar_date'] }}&f[listings.host_is_superhost]={{ listings.host_is_superhost }}"
#    }
  # }

#   or url: "/explore/flavia_thesis/listings?fields=listings.host_name,listings.neighbourhood,listings.average_price&f[listings.neighbourhood]={{ value | url_encode }}&f[calendar.calendar_date]={{ _filters['calendar.calendar_date'] }}&f[listings.host_is_superhost]=Yes"

      # link: {
      #   label:"{{value}} Region Drill"
      #   url:"/looks/1365?&f[listings.neighbourhood]={{ value }}&f[calendar.calendar_date]={{ _filters['calendar.calendar_date'] | url_encode }}"
      # }
    drill_fields: [id,host_name, neighbourhood, amenities, beds,average_price,price]

    }

dimension: pass_dashboard_filter_to_Look{
  label: "-"
  case: {
    when: {
      label: "My First Link"
      sql: 1=1 ;;
    }
    when: {
      label: "My second link"
      sql: 1=1 ;;
    }
    when: {
      label: "My Third Link"
      sql: 1=1 ;;
    }
  }
  link: {
    label:"{{value}} "
    url:"/looks/1365?&f[calendar.calendar_date]={{ _filters['calendar.calendar_date'] | url_encode }}"
  }
}

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
  html:{% assign words = value | split: ' ' %}
    {% for word in words %}
    {{ word | capitalize }}
    {% endfor %} ;;
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

  measure: concat_test {
    type: string
    sql: CONCAT(${property_type},' ',' ','-',' ', '-', ' ', CAST(${sum_price} AS STRING)) ;;
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
    html: <p>This is the room type selected by the customer: {{rendered_value}}</p> ;;
    #workaround to add description to tooltip (aka hover)
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

  measure: count {
    type: count
    drill_fields: [id, name, host_name, neighbourhood, calendar.count, reviews.count]
  }

  measure: ave_count {
    type: number
    sql: AVG(${count}) ;;

  }


  measure: listings_count{
    type: count_distinct
    # filters:{
    # field: neighbourhood
    # value: "Drumcondra"
    # }
    drill_fields: [id,host_name, neighbourhood, beds,host_started_date,price]
    sql: ${id} ;;
   html: {% if value == 10000 %}
      <p style="background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %};;

#     html: {% if value == 10000 %}
#         <font color="#42a338 ">{{ rendered_value }}</font>
#       {% else %}
#         <font color="#ffb92e ">{{ rendered_value }}</font>
#       {% endif %};;

  # html: <p style=“color: grey; font-family: OpenSans; background-color:white; text-align:centre; font-size: 50%“>Coverage Rate </p> {{ rendered_value }} ;;
}
  measure: average_price {
    type: average
    sql: ${price} ;;
    value_format_name: eur
      # action: {
      #   label: "Send email"
      #   url: "https://example.com/posts"
      #   icon_url: "https://previews.123rf.com/images/mamanamsai/mamanamsai1501/mamanamsai150100386/35929070-email-icon-on-blue-background-clean-vector.jpg"
      #   form_url: "https://example.com/ping/{{ value }}/form.json"
      #   }
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

measure: test_html_dup_sum {
  type: sum
  sql: ${price} ;;
  html:  {% if value > 2000 %}
     {{ calendar_last_scraped_date._value }}
    {% else %}
   {{ sum_price._value }}
    {% endif %} ;;
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


#ADD TO TEST

# parameter: filter_by {
#   type: number
#   allowed_value: {
#     label: "Category"
#     value: "0"
#   }
#   allowed_value: {
#     label: "Sub Category"
#     value: "1"
#   }
#   allowed_value: {
#     label: "Product"
#     value: "2"
#   }
# }


# dimension: dynamic_product {
#   label: "Dynamic Product"
#   type: string
#   sql: {% if filter_by._parameter_value == '0' %}
#     ${product_category}
#     {% elsif filter_by._parameter_value == '1' %}
#     ${product_sub_category}
#     {% elsif filter_by._parameter_value == '2' %}
#     ${product_name}
#     {% else %}
#     ${product_category}
#     {% endif %} ;;

#   }
