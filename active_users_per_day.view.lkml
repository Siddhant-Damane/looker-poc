view: active_users_per_day {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: public.prod_stream_table ;;
  #
  # # Define your dimensions and measures here, like this:


  dimension: location_url {
    description: "location_url"
    type: string
    sql: ${TABLE}.location_url ;;

  }

  dimension: created_at {
    description: "When the event happened"
    type: string
    sql: ${TABLE}.created_at ;;
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

  dimension: DRF_Customer_ID {
    description: "DRF Customer ID"
    type: string
    sql:  ${TABLE}.drf_user_id ;;
  }

  measure: distinct_DRF_Customer_ID {
    description: "count of user event"
    type: count_distinct
    sql: ${DRF_Customer_ID} ;;
    drill_fields: []
  }
}
