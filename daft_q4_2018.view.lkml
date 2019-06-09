view: daft_q4_2018 {
  sql_table_name: Flavia.daft_Q4_2018 ;;

  dimension: double_bed {
    type: number
    sql: ${TABLE}.Double_Bed ;;
  }

  dimension: one_bedroom_apartment {
    type: number
    sql: ${TABLE}.One_bedroom_apartment ;;
  }

  dimension: single_bed {
    type: number
    sql: ${TABLE}.Single_Bed ;;
  }

  dimension: two_bedroom_apartment {
    type: number
    sql: ${TABLE}.two_bedroom_apartment ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
