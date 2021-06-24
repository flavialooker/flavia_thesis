view: lodg_property_trvlr_review_rtg_dim_test_more_strings {
  sql_table_name: `lookerdata.Flavia.LODG_PROPERTY_TRVLR_REVIEW_RTG_DIM_TEST_MORE_STRINGS`
    ;;

  dimension: a_thirds_column_test {
    type: string
    sql: ${TABLE}.a_thirds_column_test ;;
  }

  dimension: another_column_test {
    type: number
    sql: ${TABLE}.another_column_test ;;
  }

  dimension: currl_flag {
    type: string
    sql: ${TABLE}.currl_flag ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
