view: user_tracking_id_view {
  sql_table_name: public.prod_stream_table ;;

  dimension: user_tracking_id {
    type: string
    sql: ${TABLE}.user_tracking_id ;;
  }
  measure: count_user_tracking_id {
    type: count_distinct
    sql: ${user_tracking_id} ;;
  }

  dimension: location_url {
    type: string
    sql: ${TABLE}.location_url ;;
  }
  dimension: split_location_url {
    type: string
    sql:split_part(${location_url}, '/', 3);;
  }

  dimension: created_at_ms {
    type: number
    sql: ${TABLE}.created_at_ms ;;
  }

  dimension_group: created_at_ms_formatted {
    type: time
    datatype: epoch
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
  }
}
