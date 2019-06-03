view: dublin_regions {
  sql_table_name: Flavia.dublin_regions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_location_exact {
    type: yesno
    sql: ${TABLE}.is_location_exact ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: neighbourhood {
    type: string
    sql: ${TABLE}.neighbourhood ;;
  }

  dimension: regions {
    type: string
    sql: ${TABLE}.regions ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
