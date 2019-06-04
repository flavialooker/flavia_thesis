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
    map_layer_name: dublin_map
    sql: ${TABLE}.neighbourhood ;;

  }

  dimension: regions {
    type: string
    map_layer_name: dublin_map
    sql: ${TABLE}.regions ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
