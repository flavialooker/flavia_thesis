view: calendar {
  sql_table_name: Flavia.calendar ;;

  dimension: available {
    type: yesno
    sql: ${TABLE}.available ;;
  }
dimension: id {
  primary_key: yes
  type: string
  sql: GENERATE_UUID() ;;
}

  dimension_group: calendar {
    type: time
    timeframes: [
      raw,
      date,
      week,
      week_of_year,
      month,
      quarter,
      day_of_week,
      day_of_week_index,
      year]
    sql: ${TABLE}.date ;;
    datatype: date
#     sql:TIMESTAMP(${TABLE}.date) ;;
#     html: <p <font color="#000000 "style="font-size:20px">{{ value}}</p> </font> ;;
  }

  #COUNT OF DAY FROM FILTER INPUT
  dimension: num_days {
    type: number
    sql: DATE_DIFF({% date_end calendar_date %}, {% date_start calendar_date %}, DAY) ;;
  }

  measure: calculation_from_date_diff {
    type: number
    sql: ${count}/${num_days} ;;
  }





##########################################-------------------#####################################

  parameter: date_granularity {
    type: string
    allowed_value: { label: "By Weekly" value: "Weekly" }
    allowed_value: { label: "By Monthly" value: "Monthly" }
  }


  dimension: date_test {
    sql:
    {% if date_granularity._parameter_value == "'Weekly'" %}
    ${calendar_week_of_year}
    {% elsif date_granularity._parameter_value == "'Monthly'" %}
    ${calendar_month}
    {% else %}
    ${calendar_raw}
    {% endif %};;

      # html:
      #     {% if date_granularity._parameter_value == "'Weekly'" %}
      #     {{ rendered_value | append: "W"}}
      #     {% elsif date_granularity._parameter_value == "'Monthly'" %}
      #     {{ rendered_value | append: "-01" | date: "%B %Y" }}
      #     {% else %}
      #     date
      #     {% endif %}
      #     ;;
    }

# filter determining time range for all "A" measures
  filter: timeframe_a {
    type: date_time
  }
#   flag for "A" measures to only include appropriate time range
  dimension: group_a_yesno {
    hidden: yes
    type: yesno
    sql: {% condition timeframe_a %} ${calendar_raw} {% endcondition %} ;;
  }
#   filtered measure A
  measure: count_a {
    label: "Winter"
    type: average
    sql: ${price} ;;
    value_format_name: eur_0
    filters: {
      field: group_a_yesno
      value: "yes"
    }
  }
#   filter determining time range for all "B" measures
  filter: timeframe_b {
    type: date_time
  }
#   flag for "B" measures to only include appropriate time range
  dimension: group_b_yesno {
    hidden: yes
    type: yesno
    sql: {% condition timeframe_b %} ${calendar_raw} {% endcondition %} ;;
  }

  measure: count_b {
    label: "Summer"
    type: average
    sql: ${price} ;;
    value_format_name: eur_0
    filters: {
      field: group_b_yesno
      value: "yes"
    }
  }

  dimension: is_in_time_a_or_b {
    group_label: "Time Comparison Filters"
    type: yesno
    sql:
    {% condition timeframe_a %} ${calendar_raw} {% endcondition %} OR
    {% condition timeframe_b %} ${calendar_raw} {% endcondition %} ;;
  }

  dimension: listing_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.listing_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  measure: last_update_date {
    type: date
    drill_fields: [listings.id, listings.name, listings.host_name, calendar_date]
    sql: MAX(${calendar_date}) ;;
    convert_tz: no
  }

  measure: fist_data_date {
    type: date
    drill_fields: [listings.id, listings.name, listings.host_name, calendar_date  ]
    sql: MIN(${calendar_date}) ;;
    convert_tz: no
  }

  measure: available_listings {
    type: count_distinct
    sql: ${listing_id} ;;
    filters: {
      field: available
      value: "yes"
    }
  }

  measure: negative_values_for_testing{
    type: number
    sql: ${available_listings} - 100 ;;

  }

  measure: sum_rental {
    type: sum
    sql: ${price} ;;
    value_format_name: eur_0
  }

  measure: average_rental {
    type: average
    sql: ${price} ;;
    value_format_name: eur_0
  }

  measure: avantika_test {
    type: count_distinct
    sql: ${calendar_day_of_week_index} ;;
  }

  measure: count {
    type: count
    drill_fields: [listings.id, listings.name, listings.host_name]
  }

  dimension: test {
    type: number
    sql: DATE_DIFF(${calendar_date},CURRENT_DATE(),DAY) ;;
  }
}
