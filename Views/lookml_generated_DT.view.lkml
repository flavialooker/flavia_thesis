view: lookml_generated_dt {
  derived_table: {
    sql: SELECT
        listings.host_name  AS host_name,
  CAST(CAST(listings.host_since  AS TIMESTAMP) AS DATE) AS host_since_date
FROM Flavia.listings  AS listings
   WHERE {% condition date_filter %} CAST(listings.host_since AS TIMESTAMP) {% endcondition %}
   AND {% condition values_suggestions %} host_name {% endcondition %}



      GROUP BY 1,2
      ORDER BY 2 DESC
      LIMIT 500;;
  }

filter: date_filter {
  type: date
}

  filter: values_suggestions {
    type: string
    suggest_dimension: host_name
  }

  parameter: group_parameter {
    type: string
    allowed_value: { value: "EU" }
    allowed_value: { value: "US" }
}

  dimension: date_formatted {
    label: "Date_formatted"
    sql: ${host_since_date} ;;
    html:{% if group_parameter._parameter_value == "'EU'" %}
      {{ rendered_value | date: "%d/%m/%y" }}
      {% endif %}
    {% if group_parameter._parameter_value == "'US'" %}
     {{ rendered_value | date: "%m/%d/%y" }}
    {% endif %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: host_name {
    type: string
    sql: ${TABLE}.host_name ;;
  }

  dimension: host_since_date {
    type: date
    sql: CAST(${TABLE}.host_since_date as Timestamp) ;;
  }

  set: detail {
    fields: [host_name, host_since_date]
  }
}
