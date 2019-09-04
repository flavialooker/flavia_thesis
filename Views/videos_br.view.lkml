view: videos_br {
  sql_table_name: Fernanda_thesis.Videos_BR ;;

  dimension: category_id {
    type: number
    sql: ${TABLE}.categoryId ;;
  }

  dimension: channel_id {
    type: string
    sql: ${TABLE}.channelId ;;
  }

  dimension: channel_title {
    type: string
    sql: ${TABLE}.channelTitle ;;
  }

  dimension: comment_count {
    type: number
    sql: ${TABLE}.comment_count ;;
  }

  dimension: comments_disabled {
    type: yesno
    sql: ${TABLE}.comments_disabled ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dislikes {
    type: number
    sql: ${TABLE}.dislikes ;;
  }

  dimension: likes {
    type: number
    sql: ${TABLE}.likes ;;
  }

  dimension_group: published {
    type: time
    timeframes: [
      date,
      time,
      minute,
      minute30
    ]
    datatype:timestamp
    sql: ${TABLE}.publishedAt ;;
  }

#   dimension_group: start {
#     type: time
#     timeframes: [date, time, minute, minute30]
#     sql: ${TABLE}.start_time ;;
#     datatype: timestamp
#   }

  dimension: ratings_disabled {
    type: yesno
    sql: ${TABLE}.ratings_disabled ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: thumbnail_link {
    type: string
    sql: ${TABLE}.thumbnail_link ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: trending_date {
    type: string
    sql: ${TABLE}.trending_date ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: view_count {
    type: number
    sql: ${TABLE}.view_count ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
