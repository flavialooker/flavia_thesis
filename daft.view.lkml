view: daft {
  sql_table_name: Flavia.daft ;;

  dimension: double_bed {
    type: number
    sql: ${TABLE}.Double_Bed ;;
  }

  dimension: one_bedroom_apartment {
    type: number
    sql: ${TABLE}.One_bedroom_apartment ;;
  }

  dimension: quarter {
    type: string
    sql: CONCAT (${TABLE}.quarter, '-', CAST(${year} AS STRING)) ;;

  }

  dimension: single_bed {
    type: number
    sql: ${TABLE}.Single_Bed ;;
  }

  dimension: two_bedroom_apartment {
    type: number
    sql: ${TABLE}.two_bedroom_apartment ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: sum_apt {
    label: "Daft Entire Apt"
    type: number
    sql: (${one_bedroom_apartment} + ${two_bedroom_apartment})/2.0 ;;
  }
  measure: average_sum_apt {
    label: "Avg Entire Apt"
    type: average
    sql: ${sum_apt} ;;
    value_format_name: eur_0
  }
  measure: average_double_bed {
    label: "Avg Double Bed"
    type: average
    sql: ${double_bed} ;;
    value_format_name: eur_0
  }

  measure: average_single_bed {
    label: "Avg Single Bed"
    type: average
    sql: ${single_bed} ;;
    value_format_name: eur_0
  }
}
